resource "aws_s3_bucket" "website_bucket" {
  bucket = var.BUCKET_NAME

  tags = {
    UserUuid = var.USER_UUID
  }
}

resource "aws_s3_bucket_website_configuration" "website_conf" {
  bucket = aws_s3_bucket.website_bucket.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "terraform_data" "content_version" {
  input = var.content_version
}

resource "aws_s3_object" "website_file_index" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = "${var.public_path}/index.html"
  content_type = "text/html"

  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }

  etag = filemd5("${var.public_path}/index.html")
}

resource "aws_s3_object" "website_file_error" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = "${var.public_path}/error.html"
  content_type = "text/html"

  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }

  etag = filemd5("${var.public_path}/error.html")
}

data "aws_caller_identity" "current" {}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.website_bucket.id
  #policy = data.aws_iam_policy_document.allow_access_from_another_account.json
  policy = jsonencode({
        "Version"= "2012-10-17",
        "Statement"= {
          "Sid" = "AllowCloudFrontServicePrincipalReadOnly",
          "Effect"= "Allow",
          "Principal"= {
              "Service"= "cloudfront.amazonaws.com"
          },
          "Action"= "s3:GetObject",
          "Resource"= "arn:aws:s3:::${aws_s3_bucket.website_bucket.id}/*",
          "Condition"= {
              "StringEquals"= {
                  "AWS:SourceArn"= "arn:aws:cloudfront::${data.aws_caller_identity.current.account_id}:distribution/${aws_cloudfront_distribution.website_cf_distribution.id}"
              }
          }
        }
  })
}


resource "aws_s3_object" "upload_assets" {
  for_each = fileset("${var.public_path}/assets","*.{jpg,png,gif}")
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "assets/${each.key}"
  source = "${var.public_path}/assets/${each.key}"
  etag = filemd5("${var.public_path}/assets/${each.key}")
  lifecycle {
    replace_triggered_by = [terraform_data.content_version.output]
    ignore_changes = [etag]
  }
}
