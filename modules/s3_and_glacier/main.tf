resource "aws_glacier_vault" "this" {
  name          = var.glacier_name
  tags = {
    Name        = var.glacier_name
    Environment = var.environment
  }
}

resource "aws_s3_bucket" "this" {
  count         = length(var.s3_buckets_name)
  bucket        = element(var.s3_buckets_name, count.index)
  acl           = "private"
  force_destroy = "true"

  tags = {
    Environment = var.environment
  }
}
