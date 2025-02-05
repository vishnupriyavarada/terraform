resource "aws_instance" "this" {
  ami                    =  data.aws_ami.mydevops.id # "ami-09c813fb71547fc4f" - the ami is hardcoded.after few days the ami gets changed after few days. 
                                                   # instead of hard code we will dynamically update it with datasource.
  instance_type          = "t3.micro"
  vpc_security_group_ids = ["sg-0cd1a18a8bd745335"]#[aws_security_group.allow_tls.id]
  tags = {
    Name = "terraform-demo" # this Name should be "N" not "n"
  }

}