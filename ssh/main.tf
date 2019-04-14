locals {
  public_key_filename = "${format("%s%s%s", var.ssh_public_key_path, var.ssh_public_key_name, var.ssh_public_key_extension)}"
}

resource "aws_key_pair" "playground-user" {
  key_name   = "${var.key_name}"
  public_key = "${file("${local.public_key_filename}")}"
}
