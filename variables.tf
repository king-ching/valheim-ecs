variable "aws_region" {
  description = "AWS Region for the VPC"
  default     = "us-east-1"
}

variable "app_repository_name" {
  description = "ECR Repository Name for the app"
  default     = "valheim"
}

variable "app_container_name" {
  description = "App container name"
  default     = "app"
}

variable "nlb_port" {
  description = "Origin Network Load Balancer Port"
  default     = "2456"
}

variable "app_container_port" {
  description = "Destination Network Load Balancer Port"
  default     = "2456"
}

variable "desired_app_tasks" {
  description = "Value of the at rest container count"
  default     = "1"
}

variable "min_tasks" {
  description = "Value of the at min container count"
  default     = "1"
}

variable "max_tasks" {
  description = "Maximum"
  default     = 150
}

variable "cluster_name" {
  description = "Name of the ECS Cluster"
  default     = "vallheim"
}

variable "availability_zones" {
  description = "Availability zones for the subnets"
  default     = "us-east-1e"
}

variable "environment" {
  description = "Environment for the server"
  default     = "production"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnets_cidr" {
  description = "Public CIDR"
  default     = "10.0.1.0/24"
}
