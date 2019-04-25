provider "aws" {
  region     = "ap-northeast-1"
}

variable "cluster-name" {
  default = "designing-distributed-systems"
  type    = "string"
}

variable "key-name" {}
variable "public-key-path" {}
variable "home-ip" {}