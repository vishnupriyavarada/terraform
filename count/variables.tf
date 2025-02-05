variable "ami_id" {
  type        = string
  default     = "ami-09c813fb71547fc4f"
  description = "This is RHEL9 AMI ID"
}
variable "instances_name" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "list of instances"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Ec2 instance type"
}

variable "ec2_tags" {
  type = map(any)
  default = {
    Name        = "expense-backend-dev"
    Project     = "expense"
    Component   = "backend"
    Environment = "dev"

  }
}

variable "comman_tags" {
  type = map(any)
  default = {
    Project     = "expense"
    Environment = "dev"
  }
}
//------------------------ Rout 53 - start ----------------------------

variable "zone_id" {
  default = "Z0575420233PBQVKS4RPT"
}
variable "domain_name" {
  default = "vishnudevopsaws.online"
}


//------------------------ Rout 53 - end ------------------------------

//------------------------- Security group - start --------------------
variable "from_port" {
  type    = number
  default = 22
}

variable "to_port" {
  type    = number
  default = 22
}

variable "cidr_block" {
  type    = list(any)
  default = ["0.0.0.0/0"]
}

variable "sg-tags" {
  type = map(any)
  default = {
    Name = "allow_tls"
  }

}
//------------------------- Security group - end --------------------