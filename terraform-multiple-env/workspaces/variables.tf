variable "instance_type" {
    type = map(string)
    default = {
      "dev" = "t3.micro"
      "prod" = "t3.small"
    }
  
}