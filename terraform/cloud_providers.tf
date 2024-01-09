
# Use this or providers.tf

# For Remote State Config

# Description: 
# This provider config is used to manage state using Terraform Cloud (https://www.terraform.io/). Uncomment below lines and change organization and workspace settings to authenticate with your Terraform Cloud.

# provider "aws" {
#   region = var.region
# }

# terraform {
#   cloud {
#     organization = "ce-team-project"

#     workspaces {
#       name = "ce-team-project"
#     }
#   }
# }