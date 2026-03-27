variable "region" { 
    default = "us-east-1"
    description = "AWS region to deploy resources"
}

variable "app_name" { default = "fastapi-react-app" }

variable "backend_image" {}
variable "frontend_image" {}

variable "db_name" {}

variable "acm_certificate_arn" {}