provider "aws" {
  region = var.region
}

terraform {

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.0.1"
    }
  }

  required_version = ">= 1.3.7"
}