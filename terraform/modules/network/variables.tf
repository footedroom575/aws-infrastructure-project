# network variables

variable "vpc_name" {
  description = "name of the vpc"
  type        = string
}

variable "cluster_name" {
  description = "name of the eks cluster, for tagging subnets"
  type        = string
}

variable "availability_zones" {
  description = "aws availability zones"
}

variable "public_subnets" {
  description = "list of cidr blocks for each public subnet"
  type = list(string)
}
variable "private_subnets" {
  description = "list of cidr blocks for each private subnet"
  type = list(string)
}

variable "vpc_cidr" {
  description = "cidr block for the vpc"
  type = string
}