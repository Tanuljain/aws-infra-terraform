variable "vpc_cidr" {
  description = "AWS VPC CIDR.."
  type        = string
}

variable "environment" {
  description = "AWS Environment.."
  type        = string
}

variable "vpc_name" {
  description = "AWS VPC.."
  type        = string
}


variable "public_subnet_cidr" {
  description = "AWS Public Subnet.."
  type        = string

}

variable "private_subnets_cidr" {
  description = "AWS Private Subnets.."
  type        = list(string)
}

variable "public_subnet_name" {
  description = "AWS Public Subnet.."
  type        = string
}

variable "private_subnets_name" {
  description = "Private Subnets Name.."
  type        = list(string)
}

variable "availability_zones" {
  description = "AWS AZ Names.."
  type        = list(string)
}
