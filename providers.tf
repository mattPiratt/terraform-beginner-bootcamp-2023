terraform {
  cloud {
    organization = "qbeckmansion"
    workspaces {
      name = "terra-house-1"
    }
  }
 required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.USER_UUID
  token = var.TERRATOWNS_ACCESS_TOKEN
}