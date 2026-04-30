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

resource "aws_security_group" "platform_lab_sg" {
  name        = "platform-lab-sg"
  description = "Allow SSH access"

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name    = "platform-lab-sg"
    Project = "platform-lab"
  }
}

resource "aws_instance" "platform_lab" {
  ami                    = "ami-07dfe99e1a254d0f8"
  instance_type          = "t2.micro"
  key_name               = "platform-lab-key"
  vpc_security_group_ids = [aws_security_group.platform_lab_sg.id]

  tags = {
    Name        = "platform-lab-server"
    Project     = "platform-lab"
    Environment = "dev"
  }
}