variable "app-name" {
  description = "Name of the application"
  type        = string
}

variable "app-docker-image-repo" {
  description = "URL to the app's docker image"
  type        = string
}

variable "app-docker-image-tag" {
  description = "Name of docker image tag"
  type        = string
}

variable "app-cpu" {
  description = "Amount of CPU credits to allocate"
  type        = number
}

variable "app-memory" {
  description = "Amount of memory to allocate in Megabytes"
  type        = number
}

variable "app-environment-variables" {
  description = "Map of environment variables this app requires"
  type        = map(string)
}

variable "app-ecs-cluster-name" {
  description = "Name of the ECS cluster to provision this ECS app in"
  type        = string
}
