provider "aws" {
  version = "~> 1.60"
  region = "${var.aws_region}"
}

provider "template" {
  version = "~> 2.0"
}
