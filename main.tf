terraform {
  cloud {
    organization = "sentinel_policy"

    workspaces {
      name = "github_sentinel_practice"
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
  ami           = "YOUR_AP_SOUTH_1_AMI"
  instance_type = "t2.micro"

  tags = {
    Name = "sentinel-github-test"
  }
}