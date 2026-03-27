output "db_endpoint" { value = aws_db_instance.db.endpoint }
output "secret_arn" {
     value = data.aws_secretsmanager_secret.db.arn
}