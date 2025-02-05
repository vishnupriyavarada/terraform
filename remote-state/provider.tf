terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.84.0"
    }
  }

  backend "s3" {
    bucket = "s3-tf-terraform-backend"
    key    = "expense-dev-infra" # my entire state will be saved in this file.
    # for ex: ec2-demo file will be created and my whole state will be in this file
    # you should not use the same name for other projects . if used there whole state comes to this file
    # you should have unique keys with in the bucket. Same key shouldn't be used in other repos.

    region         = "us-east-1"
    dynamodb_table = "s3-tf-terraform-backend"
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}