variable "app_name" {}
variable "db_name" {}
variable "db_user" {}
variable "db_password" { sensitive = true }
variable "private_subnets" { type = list(string) }
variable "vpc_id" {}
