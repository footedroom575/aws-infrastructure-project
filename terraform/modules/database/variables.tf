# database module, variables

variable "db_name" {
  description = "db name for creating postgres database RDS"
  type = string
  default = "main"
}

variable "db_username" {
  description = "username for creating postgres database RDS"
  type = string
}

variable "db_password" {
  description = "username for creating postgres database RDS"
  type = string
}

variable "az" {
  description = "availability zone for postgres database RDS"
  type = string
}

variable "db_subnets" {
  description = "list of subnets for creating postgres database RDS"
  type = list(string)
}

variable "db_security_group_ids" {
  description = "list of security groups for ingress to postgres database RDS on port 5432"
  type = list(string)
}