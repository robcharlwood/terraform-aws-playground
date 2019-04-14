variable "ssh_public_key_path" {
  type    = "string"
  default = "~/.ssh/"
}

variable "ssh_public_key_name" {
  type    = "string"
  default = "id_rsa"
}

variable "ssh_public_key_extension" {
  type    = "string"
  default = ".pub"
}

variable "key_name" {
  type    = "string"
  default = "playground_user"
}
