variable "app_name" { default = "fastapi-react-app" }

variable "vpc_id" {}
variable "private_subnets" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "backend_image" {}
variable "db_secret_arn" {}
variable "db_host" {}

variable "ec2_instance_type" {
	description = "EC2 instance type for ECS cluster nodes"
	default     = "t3.micro"
}