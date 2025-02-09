data "aws_security_group" "sg-id" {
  filter {
    name   = "group-name"
    values = ["allow_tls"]
  }
}

output "sg-id" {
  value = data.aws_security_group.sg-id.id
}

