resource "aws_cloudwatch_log_group" "main" {
  name = "/ecs/${var.name}-task"

  tags = {
    Name        = "${var.name}-task"
  }
}
resource "aws_ecs_cluster" "main" {
  name = "${var.name}-cluster"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = {
    Name        = "${var.name}-cluster"
  }
}

resource "aws_ecs_task_definition" "main" {
  depends_on = [
    aws_cloudwatch_log_group.main,
    aws_ecs_cluster.main
  ]
  family                   = "${var.name}-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.container_cpu
  memory                   = var.container_memory
  execution_role_arn       = var.execution_role_arn
  task_role_arn            = var.task_role_arn
  
  container_definitions = jsonencode([{
    name        = "${var.name}-container"
    image       = "${var.container_image}"
    essential   = true
    memoryReservation = 512,
    cpu = 10,
    portMappings = [{
      protocol      = "tcp"
      containerPort = var.container_port
      hostPort      = var.container_port
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "${aws_cloudwatch_log_group.main.name}"
        awslogs-stream-prefix = "ecs"
        awslogs-region        = var.region
      }
    }
  },
  {
    name        = "${var.name}-container-fe"
    image       = "${var.container_image_fe}"
    essential   = true
    memoryReservation = 512,
    cpu = 10,
    portMappings = [{
      protocol      = "tcp"
      containerPort = 80
      hostPort      = 80
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "${aws_cloudwatch_log_group.main.name}"
        awslogs-stream-prefix = "ecs"
        awslogs-region        = var.region
      }
    }
  }
  
  
  ])

  tags = {
    Name        = "${var.name}-task"
  }
}



resource "aws_ecs_service" "main" {
  name                               = "${var.name}-service"
  cluster                            = aws_ecs_cluster.main.id
  task_definition                    = aws_ecs_task_definition.main.arn
  desired_count                      = var.service_desired_count
  platform_version                   = "LATEST"
  deployment_minimum_healthy_percent = 50
  deployment_maximum_percent         = 200
  health_check_grace_period_seconds  = 60
  launch_type                        = "FARGATE"
  scheduling_strategy                = "REPLICA"

  network_configuration {
    security_groups  = var.ecs_service_security_groups
    subnets          = var.subnets.*.id
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = var.aws_alb_target_group_arn
    container_name   = "${var.name}-container-fe"
    container_port   = 80
  }
  
  load_balancer {
    target_group_arn = var.aws_alb_target_group_backend_arn
    container_name   = "${var.name}-container"
    container_port   = var.container_port
  }
  
  # we ignore task_definition changes as the revision changes on deploy
  # of a new version of the application
  # desired_count is ignored as it can change due to autoscaling policy
  lifecycle {
    ignore_changes = [task_definition, desired_count]
  }
}

