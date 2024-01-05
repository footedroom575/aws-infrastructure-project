# root outputs

output "eks_cluster_endpoint" {
  description = "cluster endpoint"
  value       = module.eks.cluster_endpoint
}