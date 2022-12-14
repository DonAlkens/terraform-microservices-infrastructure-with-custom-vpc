resource "aws_ecs_service" "api_service" {

  name = "${var.project_name}-api-service"

  task_definition = aws_ecs_task_definition.api_task.arn
  cluster         = aws_ecs_cluster.cluster.id
  desired_count   = 1


  depends_on = [
    aws_alb_listener.lb_listener,
    aws_iam_role_policy.task_execution_role_policy
  ]

  launch_type = "FARGATE"

  load_balancer {
    target_group_arn = aws_alb_target_group.alb_target_group.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  network_configuration {
    security_groups = ["${var.ecs_sg.id}"]
    subnets         = [for subnet in var.private_subnet : subnet.id]
  }

}


resource "aws_ecs_service" "store_manager_service" {

  name = "${var.project_name}-store-manager-service"

  task_definition = aws_ecs_task_definition.store_manager_task.arn
  cluster         = aws_ecs_cluster.cluster.id
  desired_count   = 1


  depends_on = [
    aws_alb_listener.lb_listener,
    aws_iam_role_policy.task_execution_role_policy
  ]

  launch_type = "FARGATE"

  load_balancer {
    target_group_arn = aws_alb_target_group.alb_target_group.arn
    container_name   = var.container_name
    container_port   = var.container_port
  }

  network_configuration {
    security_groups = ["${var.ecs_sg.id}"]
    subnets         = [for subnet in var.private_subnet : subnet.id]
  }

}
