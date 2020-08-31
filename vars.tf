variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  type = string
  default = "us-east-1"
}
variable "project_name" {
  type = string
  default = "sptest"
}

variable "web_instance_count" {
  type = number
  default = 2
}

variable "app_instance_count" {
  type = number
  default = 2
}

variable "PATH_PUBLICKEY" {
  type = string
  default = "~/.ssh/id_rsa.pub"
}
variable "PATH_PRIVATEKEY" {
  type = string
  default = "~/.ssh/id_rsa"
}
variable "SSH_USER" {
  type = string
  default = "ec2-user"
}

variable "AMIS" {
  type = map
  default = {
    "us-east-1" = "ami-0ff8a91507f77f867"
  }
}