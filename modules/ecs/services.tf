resource "aws_ecs_service" "app" {
  name            = "app_service"
  task_definition = "${aws_ecs_task_definition.app.arn}"
  cluster         = "${aws_ecs_cluster.cluster.id}"
  launch_type     = "FARGATE"
  desired_count   = "${var.desired_app_tasks}"

  network_configuration {
    security_groups  = ["${var.security_groups_ids}"]
    subnets          = ["${var.public_subnet_ids}"]
    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = "${aws_alb_target_group.app_target_group.arn}"
    container_name   = "${var.app_container_name}"
    container_port   = "${var.app_container_port}"
  }

  depends_on = [
    "aws_alb_target_group.app_target_group",
    "aws_iam_role_policy.ecs_service_role_policy"
  ]

  lifecycle {
    ignore_changes = [
      "task_definition"
    ]
  }
}
