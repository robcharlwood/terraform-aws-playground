provider "aws" {
  region  = "eu-west-2"
  profile = "terraform"
  version = "~> 1.60"
}

module "network" {
  source             = "./network"
  ubuntu_instance_id = "${module.ec2.ubuntu_instance_id}"
}

module "security" {
  source = "./security"
  vpc_id = "${module.network.vpc_id}"
}

module "ec2" {
  source                      = "./ec2"
  allow_all_security_group_id = "${module.security.allow_all_security_group_id}"
  subnet_id                   = "${module.network.subnet_id}"
  ssh_key_name                = "${module.ssh.ssh_key_name}"
}

module "ssh" {
  source = "./ssh"
}
