resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [data.aws_security_group.sg-id.id]
  for_each = var.instance
  instance_type = each.value
  tags = {
    Name = each.key 
  }
}