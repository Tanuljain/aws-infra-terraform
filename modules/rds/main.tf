# provider "aws" {
#   profile = var.PROFILE
#   region  = var.REGION
# }

resource "aws_db_subnet_group" "this" {
  name       = "${var.identifier}-subnet-group"
  subnet_ids = var.subnets_id
  tags = {
    Name        = var.identifier
    environment = var.environment
  }
}

resource "aws_security_group" "this" {
  name = "${var.identifier}-rds-sg"

  description = "RDS (terraform-managed)"
  vpc_id      = var.vpc_id

  # Only postgresql in
  ingress {
    from_port   = var.port
    to_port     = var.port
    protocol    = "tcp"
    cidr_blocks = [var.sg_ingress_cidr_block]
  }

  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    "Name" = "${var.identifier}-rds-sg"
    environment = var.environment
  }
}

resource "aws_db_instance" "this" {
  identifier = var.db_instance_name

  engine         = var.rds_engine
  engine_version = var.engine_version
  name           = var.db_name
  username       = var.db_user
  password       = var.db_password
  port           = var.port
  instance_class = var.instance_class

  storage_type          = var.storage_type
  max_allocated_storage = var.max_allocated_storage
  allocated_storage     = var.storage

  db_subnet_group_name = aws_db_subnet_group.this.name

  vpc_security_group_ids = [aws_security_group.this.id]

  copy_tags_to_snapshot     = true
  skip_final_snapshot       = true
  final_snapshot_identifier = var.final_snapshot_identifier

  tags = {
    Name        = var.db_name
    environment = var.environment
  }

  depends_on = [
    aws_db_subnet_group.this,
    aws_security_group.this
  ]
}
