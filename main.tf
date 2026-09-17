# =========================
# SINGAPORE EC2
# =========================

resource "aws_instance" "singapore" {
  provider = aws.singapore

  ami           = var.singapore_ami
  instance_type = var.instance_type

  subnet_id = aws_subnet.singapore.id

  vpc_security_group_ids = [
    aws_security_group.singapore.id
  ]

  key_name = var.key_name

  user_data = local.singapore_user_data

  tags = {
    Name = "Singapore-Nginx-Server"
  }
}


# =========================
# US EAST EC2
# =========================

resource "aws_instance" "us_east" {
  provider = aws.us_east

  ami           = var.us_east_ami
  instance_type = var.instance_type

  subnet_id = aws_subnet.us_east.id

  vpc_security_group_ids = [
    aws_security_group.us_east.id
  ]

  key_name = var.key_name

  user_data = local.us_east_user_data

  tags = {
    Name = "US-East-Nginx-Server"
  }
}
