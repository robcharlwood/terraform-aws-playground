resource "aws_security_group" "ingress-all" {
  name   = "allow-all-security-group"
  vpc_id = "${var.vpc_id}"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = "${var.ssh_port}"
    to_port     = "${var.ssh_port}"
    protocol    = "tcp"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
