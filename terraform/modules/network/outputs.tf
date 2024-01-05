# network outputs

output "vpc_id" {
  description = "id of the vpc, for attaching vpc components"
  value       = module.vpc.vpc_id
}

output "private_subnets" {
  description   = "list of the private subnet ids, for eks cluster"
  value         = module.vpc.private_subnets
}