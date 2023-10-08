resource "random_string" "bucket_name" {
  length = 32
  special = false
  upper = false
}