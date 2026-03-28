resource "aws_lb" "alb" {
  subnets = var.public_subnets
}

resource "aws_lb_target_group" "tg" {
  port = 8000
  protocol = "HTTP"
  vpc_id = var.vpc_id

  health_check {
    path                = "/health"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_ecs_cluster" "main" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_task_definition" "task" {
  family                   = "${var.app_name}-task"
  execution_role_arn        = aws_iam_role.ecs_task_execution.arn
  task_role_arn             = aws_iam_role.ecs_task_execution.arn

  container_definitions = jsonencode([{
    name  = "fastapi"
    image = var.backend_image
    portMappings = [{ containerPort = 8000 }]
    memory = 512
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