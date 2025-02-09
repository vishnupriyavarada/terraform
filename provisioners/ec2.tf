locals {
  sg-id = data.aws_security_group.sg-id.id
}

resource "aws_instance" "this" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [local.sg-id]
  tags = {
    Name = "terraform-provisioners-demo" # this Name should be "N" not "n"
  }

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip # this is public_ip as we execute terraform from our laptop/server which is in different network
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
    ]
  }

    provisioner "remote-exec" {
      when = destroy
      inline = [
      "sudo systemctl stop nginx", # nginx server stops first and then server destroy. this is graceful shutdown
    ]
  }

}