output "random_bucket_name" {
  value = module.random.random_bucket_name
}
output "aws_bucket_name" {
  value = module.terrahouse-aws.bucket_name
}
output "website_endpoint" {
  value = module.terrahouse-aws.website_endpoint
}
output "cloudfront_url" {
  description = "The CloudFront Distribution Domain Name"
  value = module.terrahouse-aws.cloudfront_url
}