variable "ami" {
  type    = string
  default = "ami-096ea6a12ea24a797"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "subnet_id" {
  type = string
}

variable "security_group" {
  type = string
}

variable "environment" {
  type = string
}

variable "user_data" {
  type = string
}
