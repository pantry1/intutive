output "secret_manager_arn" {
  value = aws_secretsmanager_secret.store.arn
}