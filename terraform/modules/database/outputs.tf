# database module, outputs

output "db_dns_address" {
  description = "DNS address assigned when RDS database is created"
  value = aws_db_instance.main.address
}