output "secret_manager_arn" {
  value = aws_secretsmanager_secret.store.arn
}
output "efs-id" {
  value = aws_efs_file_system.efs-nexus.id
}