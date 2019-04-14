variable "ami_name" {
  type    = "string"
  default = "ubuntu-18-04-lts"
}

variable "ami_id" {
  type    = "string"
  default = "ami-07dc734dc14746eab"
}

variable "ssh_key_name" {
  type = "string"
}

variable "instance_type" {
  type    = "string"
  default = "t2.micro"
}

variable "allow_all_security_group_id" {
  type = "string"
}

variable "subnet_id" {
  type = "string"
}
