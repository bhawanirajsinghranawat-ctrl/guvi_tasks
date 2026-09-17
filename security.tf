# =========================
# SINGAPORE SECURITY GROUP
# =========================

resource "aws_security_group" "singapore" {
  provider = aws.singapore

  name        = "singapore-nginx-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.singapore.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "HTTP"
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

  tags = {
    Name = "singapore-nginx-sg"
  }
}


# =========================
# US EAST SECURITY GROUP
# =========================

resource "aws_security_group" "us_east" {
  provider = aws.us_east

  name        = "us-east-nginx-sg"
  description = "Allow SSH and HTTP"
  vpc_id      = aws_vpc.us_east.id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
  }

  ingress {
    description = "HTTP"
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

  tags = {
    Name = "us-east-nginx-sg"
  }
}
