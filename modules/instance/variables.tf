variable "environment" {
  description = "AWS Environment.."
  type        = string
}

variable "ami_id" {
  description = "AMI ID of Instance .."
  type        = string
}

variable "db_user" {
  description = "Username of Database"
  type        = string
}

variable "db_password" {
  description = "Password of Database"
  type        = string
}

variable "instance_type" {
  description = "Type of Instance"
  type        = string
}

variable "instance_name" {
  description = "Name of Instance"
  type        = string

}

variable "key_name" {
  description = "Name of Instance key"
  type        = string
}

variable "vpc_id" {
  description = "Name (id) of VPC"
  type        = string
}

variable "subnet_id" {
  description = "Name (id) of subnet"
  type        = string
}

