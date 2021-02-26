resource "aws_alb" "app_nlb" {
  name            = "${var.cluster_name}-nlb"
  subnets         = ["${var.public_subnet_ids}"]
  load_balancer_type = "network"

  tags {
    Name        = "${var.cluster_name}-nlb"
    Environment = "${var.cluster_name}"
  }
}

resource "aws_alb_target_group" "app_target_group" {
  name        = "${var.cluster_name}-nlb-target-group"
  port        = "${var.app_container_port}"
  vpc_id      = "${var.vpc_id}"
  protocol    = "TCP"
  target_type = "ip"

  lifecycle {
    create_before_destroy = true
  }

  health_check {
    interval            = 30
    port                = "${var.app_container_port}"
    healthy_threshold   = 5
    unhealthy_threshold = 5
    protocol            = "TCP"
  }

  depends_on = ["aws_alb.app_nlb"]
}

resource "aws_alb_listener" "app" {
  load_balancer_arn = "${aws_alb.app_nlb.arn}"
  port              = "${var.nlb_port}"
  protocol          = "TCP"
  depends_on        = ["aws_alb_target_group.app_target_group"]

  default_action {
    target_group_arn = "${aws_alb_target_group.app_target_group.arn}"
    type             = "forward"
  }
}
