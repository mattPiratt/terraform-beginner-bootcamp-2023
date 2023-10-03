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


