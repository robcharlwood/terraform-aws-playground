output "vpc_id" {
  value = "${aws_vpc.playground.id}"
}

output "subnet_id" {
  value = "${aws_subnet.playground-subnet-one.id}"
}
