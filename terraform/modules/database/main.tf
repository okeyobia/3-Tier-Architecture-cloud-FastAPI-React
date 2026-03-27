
data "aws_secretsmanager_secret" "db" {
  name = "${var.app_name}/db"
}

data "aws_secretsmanager_secret_version" "db" {
  secret_id = data.aws_secretsmanager_secret.db.id
}

locals {
  db_creds = jsondecode(data.aws_secretsmanager_secret_version.db.secret_string)
}

resource "aws_db_subnet_group" "rds" {
  subnet_ids = var.private_subnets
}

resource "aws_db_instance" "db" {
  engine         = "postgres"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  username       = local.db_creds.username
  password       = local.db_creds.password
  multi_az       = true
  db_subnet_group_name = aws_db_subnet_group.rds.name
}