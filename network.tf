# =========================
# SINGAPORE NETWORK
# =========================

resource "aws_vpc" "singapore" {
  provider = aws.singapore

  cidr_block           = var.singapore_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "singapore-vpc"
  }
}

resource "aws_subnet" "singapore" {
  provider = aws.singapore

  vpc_id                  = aws_vpc.singapore.id
  cidr_block              = var.singapore_subnet_cidr
  map_public_ip_on_launch = true

  tags = {
    Name = "singapore-public-subnet"
  }
}

resource "aws_internet_gateway" "singapore" {
  provider = aws.singapore

  vpc_id = aws_vpc.singapore.id

  tags = {
    Name = "singapore-igw"
  }
}

resource "aws_route_table" "singapore" {
  provider = aws.singapore

  vpc_id = aws_vpc.singapore.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.singapore.id
  }

  tags = {
    Name = "singapore-public-route-table"
  }
}

resource "aws_route_table_association" "singapore" {
  provider = aws.singapore

  subnet_id      = aws_subnet.singapore.id
  route_table_id = aws_route_table.singapore.id
}


# =========================
# US EAST NETWORK
# =========================

resource "aws_vpc" "us_east" {
  provider = aws.us_east

  cidr_block           = var.us_east_vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "us-east-vpc"
  }
}

resource "aws_subnet" "us_east" {
  provider = aws.us_east

  vpc_id                  = aws_vpc.us_east.id
  cidr_block              = var.us_east_subnet_cidr
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "us-east-public-subnet"
  }
}

resource "aws_internet_gateway" "us_east" {
  provider = aws.us_east

  vpc_id = aws_vpc.us_east.id

  tags = {
    Name = "us-east-igw"
  }
}

resource "aws_route_table" "us_east" {
  provider = aws.us_east

  vpc_id = aws_vpc.us_east.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.us_east.id
  }

  tags = {
    Name = "us-east-public-route-table"
  }
}

resource "aws_route_table_association" "us_east" {
  provider = aws.us_east

  subnet_id      = aws_subnet.us_east.id
  route_table_id = aws_route_table.us_east.id
}
