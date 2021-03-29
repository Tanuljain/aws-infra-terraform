output "vpc_id" {
  description = "Name (id) of the VPC"
  value = aws_vpc.vpc.id
}

output "public_subnet" {
  description = "Name (id) of the subnet"
  value = aws_subnet.public_subnet.id
}

output "private_subnet1" {
  description = "Name (id) of the subnet"
  value = aws_subnet.private_subnet1.id
}

output "private_subnet2" {
  description = "Name (id) of the subnet"
  value = aws_subnet.private_subnet2.id
}

output "public_subnet_tags" {
  value = aws_subnet.public_subnet.tags_all
}

output "private_subnet1_tags" {
  value = aws_subnet.private_subnet1.tags_all
}

output "private_subnet2_tags" {
  value = aws_subnet.private_subnet2.tags_all
}

output "sg_name" {
  description = "Name (id) of the Security Group"
  value = aws_security_group.default.id
}