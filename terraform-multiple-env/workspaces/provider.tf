terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

  backend "s3" {
    bucket = "s3-tf-terraform-backend"
    key    = "workspace-demo"
    region         = "us-east-1"
    dynamodb_table = "s3-tf-terraform-backend"

  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
