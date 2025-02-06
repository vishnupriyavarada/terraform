# Want r53 records as below
# mysql = mysql.vishnudevopsaws.online --> private ip
# backend = backend.vishnudevopsaws.online --> private ip 
# frontend = vishnudevopsaws.online --> public ip

resource "aws_route53_record" "expense_private" { 
  for_each = aws_instance.this
  zone_id         = var.zone_id
  name            = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}" 
  type            = "A"
  ttl             = 1
  records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]   
  allow_overwrite = true                                          
}

