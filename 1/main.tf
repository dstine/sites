terraform {
  required_version = "0.11.2"

  backend "s3" {
    bucket  = "com.github.dstine.terraform"
    key     = "sites.tfstate"
    region  = "us-east-1"
    profile = "terraform-backend"
  }
}

provider "aws" {
  version = "2.40.0"
  region  = "us-east-1"
  profile = "${var.aws_credentials_profile}"
}

data "aws_caller_identity" "current" {}
