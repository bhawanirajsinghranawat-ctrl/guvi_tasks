#
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
#mumbai provider
provider "aws" {
    alias  =  "mumbai"
    region = "ap-south-1"  
}
# singpore provider
provider "aws" {
  alias  =  "singapore"
  region = "ap-southeast-1"
}

#vpc mumbai
resource "aws_default_vpc" "default-vpc-mumbai" {
    provider = aws.mumbai
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_default_vpc" "default-vpc-singapore" {
    provider = aws.singapore
  tags = {
    Name = "Default VPC"
  }
}

#keypair
resource "aws_key_pair" "mumbai_key" {
  provider   = aws.mumbai
  key_name   = "mumbai-key"
  public_key = file("terra-key.pub")
}

resource "aws_key_pair" "singapore_key" {
  provider   = aws.singapore
  key_name   = "singapore-key"
  public_key = file("terra-key.pub")
}

#sg

# Security Group - Mumbai
resource "aws_security_group" "mumbai_sg" {
  provider = aws.mumbai
  name     = "mumbai-sg"
  vpc_id = aws_default_vpc.default-vpc-mumbai.id #interpolation


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group - Singapore
resource "aws_security_group" "singapore_sg" {
  provider = aws.singapore
  name     = "singapore-sg"
  vpc_id = aws_default_vpc.default-vpc-singapore.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
# mumbai instance
resource "aws_instance" "mumbai_instance" {
  provider = aws.mumbai

  ami                    = "ami-01a00762f46d584a1"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.mumbai_key.key_name
  vpc_security_group_ids = [aws_security_group.mumbai_sg.id]

  tags = {
    Name = "Mumbai Instance"
  }
}

# singapore instance
resource "aws_instance" "singapore_instance" {  
  provider = aws.singapore  
  ami = "ami-0532913178263be11"
  key_name = aws_key_pair.singapore_key.key_name
  instance_type = "t2.micro"

  tags={
    Name = "Singapore Instance"
  }

}

