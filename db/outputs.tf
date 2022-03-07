output "endpoint" {
  value = aws_db_instance.default.endpoint
}

output "username" {
  value = aws_db_instance.default.username
}

output "passid" {
  value = aws_secretsmanager_secret.db_credentials.id
}

output "dbname" {
  value = aws_db_instance.default.name
}
