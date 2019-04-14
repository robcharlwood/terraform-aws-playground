resource "aws_instance" "ubuntu-ec2-instance" {
  ami                    = "${var.ami_id}"
  instance_type          = "${var.instance_type}"
  key_name               = "${var.ssh_key_name}"
  vpc_security_group_ids = ["${var.allow_all_security_group_id}"]
  subnet_id              = "${var.subnet_id}"

  tags {
    name = "${var.ami_name}"
  }
}
