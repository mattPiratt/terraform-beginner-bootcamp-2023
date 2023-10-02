resource "random_string" "bucket_name" {
  length = 32
  special = false
  upper = false
}

resource "aws_s3_bucket" "website_bucket" {
  bucket = var.BUCKET_NAME

  tags = {
    UserUuid = var.USER_UUID
  }
}


