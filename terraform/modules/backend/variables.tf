variable "app_name" { default = "fastapi-react-app" }

variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "backend_image" {}
variable "db_secret_arn" {}
variable "db_host" {}