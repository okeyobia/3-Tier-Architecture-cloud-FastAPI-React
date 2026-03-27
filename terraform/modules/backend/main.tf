resource "aws_lb" "alb" {
  subnets = var.public_subnets
}

resource "aws_lb_target_group" "tg" {
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_task_definition" "task" {
  family = "${var.app_name}-task"

  container_definitions = jsonencode([{
    name  = "fastapi"
    image = var.backend_image
    portMappings = [{ containerPort = 80 }]

    secrets = [
      {
        name      = "DB_SECRET_ARN"
        valueFrom = var.db_secret_arn
      }

    ]
  }])
}

resource "aws_ecs_service" "svc" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 2
}