data "aws_caller_identity" "current" {}

data "aws_db_instance" "database" {
  db_instance_identifier = "atlassian-rds-${var.cluster_name}"
}

data "aws_secretsmanager_secret" "secret_store" {
  name = "SecretStore-${var.cluster_name}"
}