module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.2"

  cluster_name    = var.cluster_name

  # tested on this version
  cluster_version = "1.27"

  vpc_id                         = var.vpc_id

  # using private subnets to isolate eks
  # eks endpoint url is accessible publicly
  subnet_ids                     = var.private_subnets
  cluster_endpoint_public_access = true

  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }

  # using a single node group
  eks_managed_node_groups = {
    one = {
      name = "node-group-1"

      instance_types = ["t3.small"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }
}

# To link eks and add it to local context, run below:
# aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)