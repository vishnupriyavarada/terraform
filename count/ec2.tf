# resource "aws_instance" "expense" {
#   ami                    = "ami-09c813fb71547fc4f"
#   count                  = length(var.instances_name)
#   instance_type          = var.instance_type
#   vpc_security_group_ids = [aws_security_group.allow_tls.id]
#   # tags = {
#   #   Name = var.instances_name[count.index] # this Name should be "N" not "n"
#   # }
#   tags = merge(var.comman_tags,
#     {
#       Name = var.instances_name[count.index]
#     }
#   )
# }