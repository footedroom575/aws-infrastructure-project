# root main

module "network" {
    source          = "./modules/network"

    vpc_name        = var.vpc_name
    cluster_name    = var.cluster_name

    vpc_cidr = var.vpc_cidr
    availability_zones = var.availability_zones
    public_subnets = var.public_subnets
    private_subnets = var.private_subnets
}

module "eks" {
    source          = "./modules/eks"

    vpc_id          = module.network.vpc_id
    private_subnets = module.network.private_subnets
    cluster_name    = var.cluster_name
}

module "cloud-config" {
    source = "./modules/cloud-config"
}