variable "region" { default = "us-east-1" }
variable "app_name" { default = "fastapi-react-app" }

variable "backend_image" {}
variable "frontend_image" {}

variable "db_name" {}
variable "db_user" {}
variable "db_password" {
  sensitive = true
}

variable "acm_certificate_arn" {}