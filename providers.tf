terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
    region = "us-west-2"
    shared_credentials_files = [ "/Users/User/.aws/credentials" ]
    profile = "vscode"
}

locals {
  tags = {
    Terraform = "true"
    Environment = var.environment
  }
}