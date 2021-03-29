resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "key_tf" {
  key_name   = var.key_name
  public_key = tls_private_key.this.public_key_openssh
  depends_on = [
    tls_private_key.this
  ]
}

resource "local_file" "key_creation" {
  content         = tls_private_key.this.private_key_pem
  filename        = "${var.key_name}.pem"
  file_permission = "0544"
  depends_on = [
    tls_private_key.this
  ]
}

resource "aws_security_group" "allow-all" {
  name   = "allow-all"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 6556
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_RDP"
  }
}


data "template_file" "userdata_win" {
  template = <<EOF
<script>
echo "" > _INIT_STARTED_
net user ${var.db_user} /add /y
net user ${var.db_user} ${var.db_password}
net localgroup administrators ${var.db_user} /add
echo "" > _INIT_COMPLETE_
</script>
<persist>false</persist>
EOF
}

resource "aws_instance" "win-example" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = aws_key_pair.key_tf.key_name
  user_data              = data.template_file.userdata_win.rendered
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  subnet_id              = var.subnet_id
  tags = {
    Name        = var.instance_name
    Environment = var.environment
  }
}
