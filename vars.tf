variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-1"
}
variable "project_name" {}

variable "web_instance_count" {}

variable "app_instance_count" {}

variable "PATH_PUBLICKEY" {
  default = "~/.ssh/id_rsa.pub"
}
variable "PATH_PRIVATEKEY" {
  default = "~/.ssh/id_rsa"
}
variable "SSH_USER" {
  default = "ec2-user"
}

variable "AMIS" {
  type = map
  default = {
    "us-east-1" = "ami-0ff8a91507f77f867"
  }
}