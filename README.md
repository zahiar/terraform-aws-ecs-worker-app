# Terraform AWS ECS Worker App Module

A terraform module to create a worker app (complete with ECS service & task definition) in AWS ECS.
A "worker" app is one that does not serve any web traffic, therefore does not need an AWS ALB.

## Usage Example
```
provider "aws" {
  region = "eu-west-2"
}

module "my-worker-app" {
  source = "zahiar/ecs-worker-app/aws"

  app-cpu = 1024
  app-docker-image-repo = "my-app/worker"
  app-docker-image-tag = "latest"
  app-ecs-cluster-name = "my-cluster"
  app-memory = 1024
  app-name = "my-worker-app"
  app-environment-variables = {
    SOME_ENV: "SOME_VALUE"
    ANOTHER_ENV: "ANOTHER_VALUE"
  }
}
```
