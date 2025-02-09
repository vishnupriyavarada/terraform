# resource "aws_route53_record" "expense_private" {
#   count           = 3
#   zone_id         = var.zone_id
#   name            = "${var.instances[count.index]}.${var.domain_name}" # interpolation for ex: "Hello , ${var.name}"
#   type            = "A"
#   ttl             = 1
#   records         = [aws_instance.expense[count.index].private_ip] # list type
#   allow_overwrite = true                                           # this will overwrite already existing records
# }

# resource "aws_route53_record" "expense_public" {
#   zone_id         = var.zone_id
#   name            = var.domain_name # interpolation for ex: "Hello , ${var.name}"
#   type            = "A"
#   ttl             = 1
#   records         = [aws_instance.expense[2].public_ip] # list type
#   allow_overwrite = true                                # this will overwrite already existing records
# }