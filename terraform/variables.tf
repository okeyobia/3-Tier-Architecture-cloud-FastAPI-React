variable "region" { 
    default = "us-east-1"
    description = "AWS region to deploy resources"
}

variable "app_name" { default = "fastapi-react-app" }

variable "backend_image" {}
variable "frontend_image" {}

variable "db_name" {
    type = string
}

variable "ec2_instance_type" {
    description = "EC2 instance type for ECS cluster nodes"
    default     = "t3.micro"
}