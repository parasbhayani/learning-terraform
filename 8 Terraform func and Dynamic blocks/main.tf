locals {
  rules = [{
    description = "description 0",
    port = 80,
    cidr_blocks = ["0.0.0.0/0"],
  },{
    description = "description 1",
    port = 81,
    cidr_blocks = ["10.0.0.0/16"],
  }]
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "attrs" {
  name        = "demo-attrs"
  description = "demo-attrs"

  dynamic "ingress" {
    for_each = local.rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.cidr_blocks
    }
  }
}