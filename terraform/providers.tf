

# Use this or cloud_providers.tf

# For Local State Config

# Description: 
# This provider config is used to manage state locally. If you wish to use Terraform Cloud, comment below lines and uncomment cloud_providers.tf as per instructions.

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