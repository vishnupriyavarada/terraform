resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = lookup(var.instance_type, terraform.workspace)
  #vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = "terraform-demo-${terraform.workspace}" # this Name should be "N" not "n"
  }

}

# lookup function - retrieves the value of a single element from map 
# lookup(map, key, default)