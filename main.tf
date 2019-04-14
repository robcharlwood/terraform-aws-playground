provider "aws" {
  region  = "eu-west-2"
  profile = "terraform"
  version = "~> 1.60"
}

module "ssh" {
  source = "./ssh"
}
