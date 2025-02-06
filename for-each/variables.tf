variable "instance" {
    type = map(string)
    default = {
      "mysql" = "t3.small"
      "backend"="t3.micro"
      "frontend"="t3.micro"
    }  
}

variable "zone_id" {
    type = string
    default = "Z0575420233PBQVKS4RPT"  
}

variable "domain_name" {  
  type = string
  default = "vishnudevopsaws.online"
}