# module "terrahouse-aws" {
#   source = "./modules/terrahouse-aws"
#   USER_UUID = var.USER_UUID
#   BUCKET_NAME = var.BUCKET_NAME
#   AWS_DEFAULT_REGION = var.AWS_DEFAULT_REGION
#   AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
#   AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
#   FILE_index_html = var.FILE_index_html
#   FILE_error_html = var.FILE_error_html
#   content_version = var.content_version
#   assets_path = var.assets_path
# }

# module "random" {
#   source = "./modules/random"
# }


resource "terratowns_home" "home" {
  name = "How to play Arcanum in 2023!!!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  #domain_name = module.terrahouse_aws.cloudfront_url
  domain_name = "3fdq3gz.cloudfront.net"
  town = "gamers-grotto"
  content_version = 1
}

