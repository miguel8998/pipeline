# aws Access keys
provider "aws" {
    access_key = var.access_key
    secret_key = var.secret_key
    region = "eu-west-1"

}

resource "aws_ecs_service" "new_task" {
  name = "my_app_prod"
  launch_type = "FARGATE"
  cluster = "arn:aws:ecs:eu-west-1:631692196381:cluster/weather-cluster"
  task_definition = "arn:aws:ecs:eu-west-1:631692196381:task-definition/weather-task:1"
  force_new_deployment = true
  desired_count = "1"

  load_balancer {
    container_name = "weather-container"
    container_port = "5000"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:631692196381:targetgroup/EC2Co-Defau-1R1T894IVI1RF/6f63c8ee6e74c5d0"
  }
  
  network_configuration {
    subnets = ["subnet-036cd3e5ad6fe166c", "subnet-0a6cf92f42a762122"]
    security_groups = [ "sg-0a9915e38950324fe" ]
    assign_public_ip = true
  }
}