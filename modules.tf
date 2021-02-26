module "vpc" {
  source               = "./modules/vpc"
  nlb_port             = "${var.nlb_port}"
  app_container_port   = "${var.app_container_port}"
  availability_zones   = "${var.availability_zones}"
  environment          = "${var.environment}"
  public_subnets_cidr  = "${var.public_subnets_cidr}"
  cluster_name         = "${var.cluster_name}"
  vpc_cidr             = "${var.vpc_cidr}"
}

module "ecs" {
  source                  = "./modules/ecs"
  aws_region              = "${var.aws_region}"
  cluster_name            = "${var.cluster_name}"
  desired_app_tasks       = "${var.desired_app_tasks}"
  min_tasks               = "${var.min_tasks}"
  app_repository_name     = "${var.app_repository_name}"
  app_container_name      = "${var.app_container_name}"
  nlb_port                = "${var.nlb_port}"
  app_container_port      = "${var.app_container_port}"
  max_tasks               = "${var.max_tasks}"
  vpc_id                  = "${module.vpc.vpc_id}"
  public_subnet_ids       = ["${module.vpc.public_subnet_id}"]
  app_inbound_sg_id       = "${module.vpc.app_inbound_sg_id}"
  availability_zones      = ["${var.availability_zones}"]
  environment             = "${var.environment}"

  security_groups_ids = [
    "${module.vpc.app_inbound_sg_id}",
    "${module.vpc.ecs_sg_id}"
  ]
}
