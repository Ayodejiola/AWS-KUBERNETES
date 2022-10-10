terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
   backend "local" {
        path = "./terraform.tfstate"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  access_key = var.aws-access-key
  secret_key = var.aws-secret-key
}