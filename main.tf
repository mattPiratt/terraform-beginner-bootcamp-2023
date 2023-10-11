module "terrahouse-aws-batman" {
  source = "./modules/terrahouse-aws"
  USER_UUID = var.USER_UUID
  BUCKET_NAME = module.random.random_bucket_name1
  AWS_DEFAULT_REGION = var.AWS_DEFAULT_REGION
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
  AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
  public_path = var.darkknight.public_path
  content_version = var.darkknight.content_version
}
module "terrahouse-aws-arcanum" {
  source = "./modules/terrahouse-aws"
  USER_UUID = var.USER_UUID
  BUCKET_NAME = module.random.random_bucket_name2
  AWS_DEFAULT_REGION = var.AWS_DEFAULT_REGION
  AWS_SECRET_ACCESS_KEY = var.AWS_SECRET_ACCESS_KEY
  AWS_ACCESS_KEY_ID = var.AWS_ACCESS_KEY_ID
  public_path = var.arcanum.public_path
  content_version = var.arcanum.content_version
}

module "random" {
  source = "./modules/random"
}


resource "terratowns_home" "home_batman" {
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
  domain_name = module.terrahouse-aws-batman.cloudfront_url
  town = "cooker-cove"
  content_version = var.darkknight.content_version
}

resource "terratowns_home" "home_arcanum" {
  name = "How to play Arcanum in 2023!"
  description = <<DESCRIPTION
Arcanum is a game from 2001 that shipped with alot of bugs.
Modders have removed all the originals making this game really fun
to play (despite that old look graphics). This is my guide that will
show you how to play arcanum without spoiling the plot.
DESCRIPTION
  domain_name = module.terrahouse-aws-arcanum.cloudfront_url
  town = "gamers-grotto"
  content_version = var.arcanum.content_version
}
