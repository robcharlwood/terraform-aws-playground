resource "aws_vpc" "playground" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = "${var.enable_dns_hostnames}"
  enable_dns_support   = "${var.enable_dns_support}"

  tags {
    name = "playground"
  }
}

resource "aws_subnet" "playground-subnet-one" {
  cidr_block        = "${cidrsubnet(aws_vpc.playground.cidr_block, 3, 1)}"
  vpc_id            = "${aws_vpc.playground.id}"
  availability_zone = "${var.subnet_zone}"
}

resource "aws_route_table" "playground-route-table" {
  vpc_id = "${aws_vpc.playground.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.playground-internet-gateway.id}"
  }

  tags {
    name = "playground-route-table"
  }
}

resource "aws_route_table_association" "playground-subnet-one-assoc" {
  subnet_id      = "${aws_subnet.playground-subnet-one.id}"
  route_table_id = "${aws_route_table.playground-route-table.id}"
}

resource "aws_eip" "playground-elastic-ip" {
  instance = "${var.ubuntu_instance_id}"
  vpc      = true
}

resource "aws_internet_gateway" "playground-internet-gateway" {
  vpc_id = "${aws_vpc.playground.id}"

  tags {
    name = "playground-internet-gateway"
  }
}
