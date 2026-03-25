resource "aws_secretsmanager_secret" "db" {
  name = "${var.app_name}-db-secret"
}

resource "aws_secretsmanager_secret_version" "db" {
  secret_id = aws_secretsmanager_secret.db.id
  secret_string = jsonencode({
    username = var.db_user
    password = var.db_password
  })
}

resource "aws_db_subnet_group" "rds" {
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "db" {
  engine         = "postgres"
  instance_class = "db.t3.micro"
  username       = var.db_user
  password       = var.db_password
  multi_az       = true
  db_subnet_group_name = aws_db_subnet_group.rds.name
}