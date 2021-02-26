variable "aws_region" {
  description = "The operating region"
}

variable "cluster_name" {
  description = "The cluster_name"
}

variable "app_repository_name" {
  description = "Name of ECR Repository"
}

variable "app_container_name" {
  description = "App container name"
}

variable "vpc_id" {
  description = "The VPC id"
}

variable "availability_zones" {
  type        = "list"
  description = "The azs to use"
}

variable "public_subnet_ids" {
  type        = "list"
  description = "The ids of the public subnets"
}

variable "app_inbound_sg_id" {
  description = "Application Load Balancer Security Group"
}

variable "security_groups_ids" {
  type        = "list"
  description = "Security group lists"
}

variable "nlb_port" {
  description = "NLB listener port"
}

variable "app_container_port" {
  description = "Listening port for the application"
}

variable "desired_app_tasks" {
  description = "Number of containers desired to run the app task"
}

variable "min_tasks" {
  description = "Minimum"
}

variable "max_tasks" {
  description = "Maximum"
}

variable "environment" {
  description = "Valheim environment"
}




