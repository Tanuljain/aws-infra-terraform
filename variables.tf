#  Global Vars
variable "REGION" {
  description = "AWS Deployment region.."
  default     = "us-east-2"
}

variable "environment" {
  description = "AWS Environment.."
  default     = "stage"
}

variable "PROFILE" {
  description = "Profile Name of Cloud"
  type        = string
}

# VPC Module Vars
variable "vpc_name" {
  description = "AWS VPC.."
  default     = "test"
}

variable "vpc_cidr" {
  description = "AWS VPC CIDR.."
  default     = "10.10.0.0/16"
}

variable "public_subnet_name" {
  description = "AWS Public Subnet.."
  default     = "web-tier"
}

variable "public_subnet_cidr" {
  description = "AWS Public Subnet.."
  default     = "10.10.0.0/20"
}

variable "private_subnets_name" {
  type    = list(string)
  default = ["app-tier", "backend-tier"]
}

variable "private_subnets_cidr" {
  type    = list(string)
  default = ["10.10.16.0/20", "10.10.32.0/20"]
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

# Instance Module Vars

variable "ami_id" {
  description = "Windows AMI ID.."
  default     = "ami-0db6a09e9ade44bb3"
}

# variable "db_username" {
#   description = "Username of Database"
#   type        = string
# }

# variable "db_password" {
#   description = "Password of Database"
#   type        = string
# }

variable "instance_type" {
  description = "Type of Instance"
  default     = "t2.micro"
}

variable "instance_name" {
  description = "Name of Instance"
  default     = "Windows_Server"
}

variable "key_name" {
  description = "Name of Instance key"
  default     = "key_tf"
}

# RDS Module Vars
variable "rds_engine" {
  description = "RDS Engine name"
  type        = string
  default     = "postgres"
}

variable "engine_version" {
  description = "RDS DB Engine Version"
  type        = string
  default     = "13.1"
}

variable "identifier" {
  description = "Subnet Group Identifier"
  type        = string
  default     = "postgres"
}

# variable "sg_ingress_cidr_block" {
#   description = "CIDR Block.."
#   type        = string
#   default     = var.vpc_cidr
# }

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
  default     = "db.t3.micro"
}

variable "storage_type" {
  description = "One of standard (magnetic), gp2 (general purpose SSD), or io1 (provisioned IOPS SSD)"
  type        = string
  default     = "gp2"
}

variable "storage" {
  description = "Allocated Storage"
  type        = string
  default     = "20"
}

variable "max_allocated_storage" {
  type        = string
  description = "The upper limit to which Amazon RDS can automatically scale the storage of the DB instance."
  default     = "0"
}

variable "db_instance_name" {
  description = "The RDS DB instance Name"
  type        = string
  default     = "postgres-db"
}

variable "db_name" {
  description = "Name of the DB Instance"
  type        = string
  default     = "postgres"
}

variable "db_user" {
  description = "Username for the DB user"
  type        = string
}

variable "db_password" {
  description = "Password for the DB user"
  type        = string
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = "5432"
}

variable "final_snapshot_identifier" {
  description = "The RDS DB instance Name"
  type        = string
  default     = "postgres-db"
}

# s3 and Glacier Module Vars
variable "glacier_name" {
  description = "Name of AWS Glacier Vault"
  type        = string
  default     = "s3_archive"
}

variable "s3_buckets_name" {
  description = "Buckets name list"
  type        = list(string)
  default     = ["stage-bucket-tj", "qa-bucket-tj"]
}