variable "environment" {
  description = "AWS Environment.."
  type        = string
}

variable "glacier_name" {
  description = "Name of AWS Glacier Vault"
  type        = string
}

variable "s3_buckets_name" {
  description = "Bucket name list"
  type        = list(string)
}
