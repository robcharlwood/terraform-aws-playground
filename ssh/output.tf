output "ssh_key_name" {
  value = "${aws_key_pair.playground-user.key_name}"
}
