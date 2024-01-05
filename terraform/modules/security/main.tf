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

# security group for EKS
resource "aws_security_group" "rds" {
  name        = "${var.vpc_name}-rds-security-group"
  description = "Security group for rds"
  vpc_id      = var.vpc_id
}

# only allowed tcp 5432 inbound
resource "aws_security_group_rule" "allow_rds_ingress" {
  type              = "ingress"
  from_port         = 5432
  to_port           = 5432
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.rds.id
}

# can access internet
resource "aws_security_group_rule" "allow_rds_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
  security_group_id = aws_security_group.rds.id
}