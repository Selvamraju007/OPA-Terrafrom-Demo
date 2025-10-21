
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "example" {
  bucket = "selvamraju-demo-bucket-opa"
  acl    = "public-read" # This should fail the policy
  tags = {
    Name        = "demo-bucket"
    Environment = "dev"
  }
}
