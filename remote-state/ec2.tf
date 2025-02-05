locals {
  sg-id = data.aws_security_group.sg_id.id
}

resource "aws_instance" "this" {
  ami           = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  #vpc_security_group_ids = ""//[aws_security_group.allow_tls.id]
  tags = {
    Name = "terraform-demo" # this Name should be "N" not "n"
  }

}