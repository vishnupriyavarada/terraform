resource "aws_instance" "this" {
  ami                    = var.ami_id                                         #"ami-09c813fb71547fc4f"
  instance_type          = var.environment == "dev" ? "t3.micro" : "t3.small" # var.instance_type 
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags                   = var.ec2_tags

}