output "vpc_id" {
  value = "${aws_vpc.vpc.id}"
}

output "app_inbound_sg_id" {
  value = "${aws_security_group.app_inbound_sg.id}"
}

output "ecs_sg_id" {
  value = "${aws_security_group.ecs_sg.id}"
}

output "public_subnet_id" {
  value = ["${aws_subnet.public_subnet.id}"]
}

