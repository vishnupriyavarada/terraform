resource "aws_security_group" "allow_tls" {
  name        = "allow_tls_sg"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id - if you do not give vpc_id then terraform will take default vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocals
    cidr_blocks = ["0.0.0.0/0"]
  }

  dynamic "ingress" {# In ansible , the keyword for iteration is 'item'. here in terraform , the keyword is the blockname.
                     #Here it is 'ingress'. hence use ingress as keyword as below
    for_each = var.ingress_ports
    content {
      from_port = ingress.value["from_port"]
      to_port = ingress.value["to_port"]
      protocol = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr"]
    }
  }

  tags = {
    Name = "allow_tls_sg"
  }
}