resource "aws_instance" "this" {
  ami           = local.ami_id        # data.aws_ami.mydevops.id - Keeping this expression in locals
  instance_type = local.instance_type # if this instance_type is put in variables nobody can override it
  # vpc_security_group_ids = [aws_security_group.allow_tls.id] - 
  vpc_security_group_ids = local.sg_id # [data.aws_security_group.sg_id.id] - Keeping this expression in locals
  tags = {
    
    Name = local.name
  }

}