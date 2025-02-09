resource "aws_security_group" "allow_tls" {
  name        = "SG-${var.project}-${var.environment}"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id - if you do not give vpc_id then terraform will take default vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocals
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {
    for_each = var.ingress_var
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  tags = {
    Name = "SG-${var.project}-${var.environment}"
  }
}