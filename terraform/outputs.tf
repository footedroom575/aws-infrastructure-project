# root outputs

output "eks_cluster_endpoint" {
  description = "cluster endpoint"
  value       = module.eks.cluster_endpoint
}

# user cluster_name and region to add EKS to local context if applies
output "cluster_name" {
  description = "Name assigned to cluster"
  value       = var.cluster_name
}

output "region" {
  description = "Infrastructure region"
  value       = var.region
}

output "db_dns_address" {
  description = "DNS address assigned when RDS database is created"
  value = module.database.db_dns_address
}