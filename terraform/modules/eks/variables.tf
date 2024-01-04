variable "cluster_name" {
  description = "EKS cluster name - used for identifying network aspects with tags"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC to place the cluster in"
  type        = string
}

variable "private_subnets" {
  description = "Private Subnet IDs for the cluster"
  type        = list(string)
}