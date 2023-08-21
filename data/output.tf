output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "rds_engine" {
  value = aws_db_instance.default.engine
}

output "secret_manager_arn" {
  value = aws_secretsmanager_secret.store.arn
}