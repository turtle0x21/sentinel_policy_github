terraform {
  cloud {
    organization = "sentinel_policy"

    workspaces {
      name = "sentinel_practice"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "sentinel_test" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"

  tags = {
    Name        = "sentinel-github-test"
    Environment = "practice"
  }
}