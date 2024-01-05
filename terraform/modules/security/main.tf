# security main

resource "aws_security_group" "eks" {
  name        = "${var.vpc_name}-eks-security-group"
  description = "Security group for eks"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = [local.http, local.https, local.ssh, local.api]
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [local.ipv4_wildcard]
      ipv6_cidr_blocks = [local.ipv6_wildcard]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.ipv4_wildcard]
    ipv6_cidr_blocks = [local.ipv6_wildcard]
  }

  tags = {
    ManagedBy = "Terraform"
  }
}

resource "aws_security_group" "rds" {
  name        = "${var.vpc_name}-rds-security-group"
  description = "Security group for rds"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    iterator = port
    for_each = [local.http, local.https, local.ssh, local.api, local.postgres]
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = [local.ipv4_wildcard]
      ipv6_cidr_blocks = [local.ipv6_wildcard]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [local.ipv4_wildcard]
    ipv6_cidr_blocks = [local.ipv6_wildcard]
  }

  tags = {
    ManagedBy = "Terraform"
  }
}