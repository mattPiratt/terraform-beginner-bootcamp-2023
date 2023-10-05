resource "random_string" "bucket_name" {
  length = 32
  special = false
  upper = false
}

module "terrahouse-aws" {
  source = "./modules/terrahouse-aws"
  USER_UUID = var.USER_UUID
  BUCKET_NAME = var.BUCKET_NAME
  AWS_DEFAULT_REGION = var.AWS_DEFAULT_REGION
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
  AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
  FILE_index_html = var.FILE_index_html
  FILE_error_html = var.FILE_error_html
  content_version = var.content_version
  assets_path = var.assets_path
}

