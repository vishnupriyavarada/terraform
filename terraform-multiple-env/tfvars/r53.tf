resource "aws_route53_record" "expense_private" {
  count           = length(var.instances)
  zone_id         = var.zone_id
# if instance is name is front end and prod, record should be just domain_name(vishnudevopsaws.online)
# rest all cases it can be instancename.domain name like for ex: mysql.vishnudevopsaws.online 
  name            = var.instances[count.index] == "frontend" && var.environment == "prod" ? var.domain_name : "${var.instances[count.index]}-${var.environment}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = [var.instances[count.index] == "frontend" && var.environment == "prod" ? aws_instance.expense[count.index].public_ip : aws_instance.expense[count.index].private_ip]
  allow_overwrite = true                                           # this will overwrite already existing records
}
