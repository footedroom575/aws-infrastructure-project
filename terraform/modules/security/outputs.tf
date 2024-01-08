# security outputs

output "security_group_eks_id" {
  description = "security group for load balancer, created for: assigning security rules to EKS"
  value = aws_security_group.eks.id
}

output "security_group_rds_id" {
    description = "security group for api instances, created for: assigning security rules to RDS"
  value = aws_security_group.rds.id
}