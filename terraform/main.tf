terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "platform_lab" {
  ami           = "ami-07dfe99e1a254d0f8"  # Ubuntu 22.04 LTS, Sydney
  instance_type = "t2.micro"              # free tier eligible

  tags = {
    Name        = "platform-lab-server"
    Project     = "platform-lab"
    Environment = "dev"
  }
}