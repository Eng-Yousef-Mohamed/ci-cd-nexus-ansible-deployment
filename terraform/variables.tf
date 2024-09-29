variable "vpc_cidr_block" {
  
description = "this is cidr block of created vpc "
type = string

}

variable "subnet_cidr_block" {

description = "this is cidr block of created subnet "
type =string

}

variable "Name_vpc" {
  description = "this name vpc "
  type = string
}
variable "Name_subnet" {
  description = "this name vpc "
  type = string
}

variable "instance_type" {
  description = "This describes the instance type"
  type = string
  default = "t3.micro"
}

variable "ami_id" {
    description = "This describes the ami image which Amazon Linux 2023 AMI"
    type = string
    default = "ami-090abff6ae1141d7d"
}

variable "ssh_port" {
  description = "SSH Port"
  type = number
  
}
variable "HTTP_port" {
  description = "HTTP Port"
  type = number
  
}
variable "Nexus_port" {
  description = "Nexus Port"
  type = number
}
variable "region" {
  type = string

}
variable "Name_internet_gateway" {
  type = string
}
variable "Name_route_table" {
  type = string
}
variable "Name_ec2" {
  type = string
}