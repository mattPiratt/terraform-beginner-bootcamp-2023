output "random_bucket_name" {
  value = random_string.bucket_name.id
}
output "bucket_name" {
  value = module.terrahouse-aws.bucket_name
}
output "website_endpoint" {
  value = module.terrahouse-aws.website_endpoint
}
