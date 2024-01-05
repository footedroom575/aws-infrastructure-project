# network main

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.vpc_name
  cidr = var.vpc_cidr
  azs  = var.availability_zones

  # configuring NAT restricts traffic to connect through NAT only which involves certain proxy setups to get to our desired network location
  # making it false for now and will change it in future for security improvements
  enable_nat_gateway   = false
  single_nat_gateway   = false
  enable_dns_hostnames = true

  public_subnets = var.public_subnets
  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                    = 1
  }

  private_subnets = var.private_subnets
  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"           = 1
  }

  tags = {
    ManagedBy = "Terraform"
  }
}
