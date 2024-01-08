# root main

module "network" {
  source = "./modules/network"

  vpc_name     = var.vpc_name
  cluster_name = var.cluster_name

  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
}

module "eks" {
  source = "./modules/eks"

  vpc_id          = module.network.vpc_id
  private_subnets = module.network.private_subnets
  cluster_name    = var.cluster_name
}

module "security" {
  source = "./modules/security"

  vpc_name = var.vpc_name
  vpc_id   = module.network.vpc_id
}

module "database" {
  source = "./modules/database"

  db_name               = var.db_name
  db_username           = var.db_username
  db_password           = var.db_password
  db_subnets            = module.network.public_subnets
  db_security_group_ids = [module.security.security_group_rds_id]

  # using only 1 availability zone for now to avoid any database sync issues
  az                    = var.availability_zones[0]
}

module "cloud-config" {
  source = "./modules/cloud-config"
}
