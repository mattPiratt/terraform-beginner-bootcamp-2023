terraform {
  cloud {
    organization = "qbeckmansion"
    workspaces {
      name = "terra-house-1"
    }
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}

# provider "aws" {
#   # Configuration options
# }

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

resource "aws_s3_object" "website_file_index" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "index.html"
  source = var.FILE_index_html

  etag = filemd5(var.FILE_index_html)
}

resource "aws_s3_object" "website_file_error" {
  bucket = aws_s3_bucket.website_bucket.bucket
  key    = "error.html"
  source = var.FILE_error_html

  etag = filemd5(var.FILE_error_html)
}

