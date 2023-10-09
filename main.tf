module "terrahouse-aws" {
  source = "./modules/terrahouse-aws"
  USER_UUID = var.USER_UUID
  BUCKET_NAME = module.random.random_bucket_name
  AWS_DEFAULT_REGION = var.AWS_DEFAULT_REGION
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
  AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
  FILE_index_html = var.FILE_index_html
  FILE_error_html = var.FILE_error_html
  content_version = var.content_version
  assets_path = var.assets_path
}

module "random" {
  source = "./modules/random"
}


resource "terratowns_home" "home" {
  name = "The Dark Knight"
  description = <<DESCRIPTION
The Dark Knight, also known as Batman, is like that one friend who shows 
up at parties in an impeccable costume but insists on brooding in the corner. 
With more gadgets than your average tech store and a knack for disappearing 
when you least expect it, he's the hero Gotham deserves but maybe not 
the one it needs right now. And let's not forget, his arch-nemesis, 
the Joker, gives new meaning to the phrase "Why so serious?" It's a 
never-ending battle of capes, makeup, and wild plans – all in a day's 
work for the Dark Knight!
DESCRIPTION
  domain_name = module.terrahouse-aws.cloudfront_url
  town = "missingo"
  content_version = var.content_version
}

