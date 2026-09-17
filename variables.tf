variable "singapore_region" {
  description = "AWS region for Singapore"
  type        = string
  default     = "ap-southeast-1"
}

variable "us_east_region" {
  description = "AWS region for US East"
  type        = string
  default     = "us-east-1"
}

variable "singapore_ami" {
  description = "Ubuntu AMI for Singapore"
  type        = string
  default     = "ami-0532913178263be11"
}

variable "us_east_ami" {
  description = "Ubuntu AMI for US East"
  type        = string
  default     = "ami-025d99823a4caad37"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
  default     = "project2-2"
}

variable "singapore_vpc_cidr" {
  description = "Singapore VPC CIDR"
  type        = string
  default     = "10.20.0.0/16"
}

variable "us_east_vpc_cidr" {
  description = "US East VPC CIDR"
  type        = string
  default     = "10.30.0.0/16"
}

variable "singapore_subnet_cidr" {
  description = "Singapore subnet CIDR"
  type        = string
  default     = "10.20.1.0/24"
}

variable "us_east_subnet_cidr" {
  description = "US East subnet CIDR"
  type        = string
  default     = "10.30.1.0/24"
}

variable "allowed_ssh_cidr" {
  description = "CIDR allowed for SSH"
  type        = string
  default     = "0.0.0.0/0"
}
