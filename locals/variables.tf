variable "project" {
  type    = string
  default = "expense"
}

variable "component" {
  type    = string
  default = "backend"
}

variable "environment" {
  type    = string
  default = "dev"
}

# you can not use variables with in another variable. TF throws error. Put the below expression in locals to work
# variable "name" {
#   default = "${var.project}-${var.environment}-${var.component}"
# }