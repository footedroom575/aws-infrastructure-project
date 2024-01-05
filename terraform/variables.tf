# root variables

variable "region" {
  description = "aws region"
  type        = string
}

variable "vpc_name" {
  description = "name of vpc"
  type        = string
}

variable "cluster_name" {
  description = "name of eks cluster"
  type        = string
}

variable "public_subnets" {
  description = "list of cidr blocks for each public subnet"
  type = list(string)
}
variable "private_subnets" {
  description = "list of cidr blocks for each private subnet"
  type = list(string)
}

variable "availability_zones" {
  description = "AWS availability zones"
  type = list(string)
  default = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
}

variable "vpc_cidr" {
  description = "cidr block for the vpc"
  type = string
}