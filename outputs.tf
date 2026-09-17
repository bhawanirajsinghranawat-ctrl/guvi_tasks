output "singapore_instance_id" {
  value = aws_instance.singapore.id
}

output "singapore_public_ip" {
  value = aws_instance.singapore.public_ip
}

output "singapore_nginx_url" {
  value = "http://${aws_instance.singapore.public_ip}"
}


output "us_east_instance_id" {
  value = aws_instance.us_east.id
}

output "us_east_public_ip" {
  value = aws_instance.us_east.public_ip
}

output "us_east_nginx_url" {
  value = "http://${aws_instance.us_east.public_ip}"
}
