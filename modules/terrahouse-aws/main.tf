terraform {
  cloud {
    organization = "qbeckmansion"
    workspaces {
      name = "terraform-cloud"
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

