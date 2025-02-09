resource "aws_instance" "expense" {
  depends_on = [aws_security_group.allow_tls]

  ami                    = var.ami_id
  count                  = length(var.instances)
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = merge(var.comman_tags,
    {
      Name = "${var.project}-${var.environment}-${var.instances[count.index]}" # expense-dev-mysql
    }
  )
}