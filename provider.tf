terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  alias  = "singapore"
  region = var.singapore_region
}

provider "aws" {
  alias  = "us_east"
  region = var.us_east_region
}

