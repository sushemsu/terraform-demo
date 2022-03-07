resource "aws_db_instance" "default" {
  allocated_storage           = var.allocated_storage
  engine                      = "mysql"
  engine_version              = var.engine_version
  instance_class              = var.instance_class
  name                        = var.db_name
  username                    = var.db_user
  password                    = random_password.db_pass.result
  parameter_group_name        = var.parameter_group_name
  skip_final_snapshot         = var.skip_final_snapshot
  max_allocated_storage       = var.max_allocated_storage
  allow_major_version_upgrade = var.allow_major_version_upgrade
  auto_minor_version_upgrade  = var.auto_minor_version_upgrade
  db_subnet_group_name        = aws_db_subnet_group.private_db_subnet.name
  vpc_security_group_ids      = [data.terraform_remote_state.eks.outputs.cluster_worker_security_group_id]
  backup_retention_period     = 1
}

resource "aws_db_instance" "replica" {
  count                   = var.db_replicas != null ? var.db_replicas : 0
  instance_class          = var.instance_class
  vpc_security_group_ids  = [data.terraform_remote_state.eks.outputs.cluster_worker_security_group_id]
  replicate_source_db     = aws_db_instance.default.arn
  backup_retention_period = 0
}

resource "random_password" "db_pass" {
  length           = 16
  special          = true
  override_special = "_%@"
}

resource "aws_db_subnet_group" "private_db_subnet" {
  name       = "private_db_subnet"
  subnet_ids = data.terraform_remote_state.core.outputs.private_subnet_ids
}

resource "aws_secretsmanager_secret" "db_credentials" {
  name = "dbcredsbase"
}

resource "aws_secretsmanager_secret_version" "db_pass" {
  secret_id     = aws_secretsmanager_secret.db_credentials.id
  secret_string = random_password.db_pass.result
}
