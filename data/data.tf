data "aws_ami" "mydevops"{
    most_recent = true
    owners = ["973714476881"]

   filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}


# data "aws_instance" "myec2"{
#     filter {
#       name = "tag:Name"
#       values = ["backend"]
#     }
# }


output "data_ami_id" {
    value = data.aws_ami.mydevops.id  
}

output "instance_ami_id" {
    value = aws_instance.this.ami
}

# output "data_publicip" {
#     value = data.aws_instance.myec2.public_ip
# }

# output "instance_publicip" {
#     value = aws_instance.this.public_ip
# }