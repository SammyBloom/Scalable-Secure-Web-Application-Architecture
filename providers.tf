terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["/Users/User/.aws/credentials"]
  profile                  = var.aws_profile
}

locals {
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }
}