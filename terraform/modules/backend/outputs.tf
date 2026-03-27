output "alb_dns" {
  value = aws_lb.alb.dns_name
}

output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution.arn
}