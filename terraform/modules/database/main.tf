# database module, main


# Databse subnet group covering all public subnets
resource "aws_db_subnet_group" "db_sn_group" {
  name       = "db_sn_group"
  subnet_ids = var.db_subnets # first subnet only for time being

  tags = {
    Name = "DB subnet group"
  }
}

resource "aws_db_instance" "main" {
  ##
  # defaults
  ##
  allocated_storage = 20
  storage_type      = "gp2"
  engine            = "postgres"
  engine_version    = "14.9"
  instance_class    = "db.t3.micro"
  port              = "5432"

  ##
  # variables
  ##
  db_name                = var.db_name
  username               = var.db_username
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_sn_group.name
  vpc_security_group_ids = var.db_security_group_ids
  availability_zone      = var.az
  multi_az               = false

  ##
  # settings
  ##
  skip_final_snapshot         = true
  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true
  apply_immediately           = true
  deletion_protection         = false
  network_type                = "IPV4"
  publicly_accessible         = true
  storage_encrypted           = false

  ##
  # secret
  ##
  # manage_master_user_password = false
  #

  ##
  # backup / snapshots
  ##
  # backup_taget =
  # backup_window =
  # snapshot_identifier =
  # delete_automated_backups =

  ##
  # monitoring, currently managed in prometheus, garfana
  ##
  # performance_insights_enabled =
  # performance_insights_kms_key_id =
  # performance_insights_retention_period =

  tags = {
    Name      = var.db_name
    ManagedBy = "Terraform"
  }
}
