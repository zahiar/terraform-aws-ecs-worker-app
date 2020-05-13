data "template_file" "app-task-definition-template" {
  template = jsonencode([
    {
      name      = var.app-name
      image     = "${var.app-docker-image-repo}:${var.app-docker-image-tag}"
      cpu       = var.app-cpu
      memory    = var.app-memory
      essential = true

      environment = tolist([
        for key, value in var.app-environment-variables :
        {
          name  = key,
          value = value
        }
      ])
    }
  ])
}

resource "aws_ecs_task_definition" "app-task" {
  family                = var.app-name
  container_definitions = data.template_file.app-task-definition-template.rendered
}

resource "aws_ecs_service" "app-ecs-service" {
  name                               = var.app-name
  cluster                            = var.app-ecs-cluster-name
  task_definition                    = aws_ecs_task_definition.app-task.family
  desired_count                      = 1
  deployment_minimum_healthy_percent = 0
  deployment_maximum_percent         = 200
}
