output "db" {
  value = aws_db_instance.this
}

output "db_endpoint" {
  description = "Database Endpoint URL to connect"
  value = aws_db_instance.this.endpoint
}