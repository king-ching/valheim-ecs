resource "aws_security_group" "app_inbound_sg" {
  name        = "${var.cluster_name}-nlb-sg"
  description = "NLB security group"
  vpc_id      = "${aws_vpc.vpc.id}"

  ingress {
    from_port   = "${var.nlb_port}"
    to_port     = "${var.app_container_port}"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port       = 2456
    to_port         = 2456
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "${var.cluster_name}-nlb-sg"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "ecs_sg" {
  vpc_id      = "${aws_vpc.vpc.id}"
  name        = "${var.cluster_name}-ecs-service-sg"
  description = "Allow egress from container"

  ingress {
    from_port   = 8
    to_port     = 0
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name        = "${var.cluster_name}-ecs-service-sg"
    Environment = "${var.cluster_name}"
  }
}
