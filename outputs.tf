output "random_bucket_name-batman" {
  value = module.random.random_bucket_name1
}
output "aws_bucket_name-batman" {
  value = module.terrahouse-aws-batman.bucket_name
}
output "website_endpoint-batman" {
  value = module.terrahouse-aws-batman.website_endpoint
}
output "cloudfront_url-batman" {
  description = "The CloudFront Distribution Domain Name"
  value = module.terrahouse-aws-batman.cloudfront_url
}
output "random_bucket_name-arcanum" {
  value = module.random.random_bucket_name2
}
output "aws_bucket_name-arcanum" {
  value = module.terrahouse-aws-arcanum.bucket_name
}
output "website_endpoint-arcanum" {
  value = module.terrahouse-aws-arcanum.website_endpoint
}
output "cloudfront_url-arcanum" {
  description = "The CloudFront Distribution Domain Name"
  value = module.terrahouse-aws-arcanum.cloudfront_url
}
