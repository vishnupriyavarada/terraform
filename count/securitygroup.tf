resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id - if you do not give vpc_id then terraform will take default vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # all protocals
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22 # Start port
    to_port     = 22 # End range port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "allow_tls"
  }
}