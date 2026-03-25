
terraform {
  required_version = ">= 1.12.0"

  backend "s3" {
    bucket       = "fastapi-react-cloud-terraform-state"
    key          = "fastapi-react-app/terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}