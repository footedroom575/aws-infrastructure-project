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

variable "instance_size_limits" {
  description = "Details for instance min_size, max_size & desired_size limits"
  type = object({
    min_size     = number
    max_size     = number
    desired_size = number
  })
  default = {
    min_size     = 1
    max_size     = 1
    desired_size = 1
  }
}
