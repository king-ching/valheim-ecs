variable "availability_zones" {
  description = "Availability zones for the subnets"
}

variable "cluster_name" {
  description = "The cluster name"
}

variable "nlb_port" {
  description = "Origin Application Load Balancer Port"
}

variable "app_container_port" {
  description = "Destination Application Load Balancer Port"
}

variable "environment" {
  description = "Valheim environment"
}

variable "public_subnets_cidr" {
  description = "Public subnet CIDR"
}

variable "vpc_cidr" {
  description = "The VPC CIDR"
}
