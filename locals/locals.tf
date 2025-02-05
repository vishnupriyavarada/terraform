locals {
  ami_id        = data.aws_ami.mydevops.id
  sg_id         = [data.aws_security_group.sg_id.id]
  instance_type = "t3.micro"
  name = "${var.project}-${var.component}"
}