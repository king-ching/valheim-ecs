data "template_file" "app_task" {
  template = "${file("${path.module}/task-definitions/app_task.json")}"

  vars {
    aws_region              = "${var.aws_region}"
    environment             = "${var.environment}"
    cluster_name            = "${var.cluster_name}"
    app_container_name      = "${var.app_container_name}"
    app_container_port      = "${var.app_container_port}"
    app_image               = "${data.aws_ecr_repository.app.repository_url}"
    log_group               = "${aws_cloudwatch_log_group.app.name}"
  }
}

resource "aws_ecs_task_definition" "app" {
  family                   = "${var.cluster_name}_app"
  container_definitions    = "${data.template_file.app_task.rendered}"
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "2048"
  memory                   = "4096"
  execution_role_arn       = "${aws_iam_role.ecs_execution_role.arn}"
  task_role_arn            = "${aws_iam_role.ecs_execution_role.arn}"

  lifecycle {
    ignore_changes = [
      "id",
      "container_definitions"
    ]
  }
}
