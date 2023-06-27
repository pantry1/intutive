output "nfs-server-public-ip" {
  value = aws_instance.nfs-server.public_ip
}

output "nfs-server-private-ip" {
  value = aws_instance.nfs-server.private_ip
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}

output "rds_engine" {
  value = aws_db_instance.default.engine
}
