terraform {
  cloud {
    organization = "sentinel_policy"

    workspaces {
      name = "sentinel_policies"
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

# ==========================================================
# EC2 INSTANCE
# ==========================================================

resource "aws_instance" "sentinel_test" {
  ami           = "YOUR_AMI_ID"
  instance_type = "t2.micro"

  tags = {
    Name        = "sentinel-ec2-test"
    Environment = "practice"
    Owner       = "terraform"
  }
}

# ==========================================================
# SECURITY GROUP
# ==========================================================

resource "aws_security_group" "sentinel_test_sg" {
  name        = "sentinel-test-sg"
  description = "Security group for Sentinel testing"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"

    cidr_blocks = ["10.0.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"

    cidr_blocks = ["10.0.0.0/16"]
  }

  tags = {
    Name        = "sentinel-test-sg"
    Environment = "practice"
  }
}

resource "aws_ebs_volume" "sentinel_test_volume" {
  availability_zone = "ap-south-1a"
  size              = 10
  encrypted         = false

  tags = {
    Name        = "sentinel-ebs-test"
    Environment = "practice"
  }
}