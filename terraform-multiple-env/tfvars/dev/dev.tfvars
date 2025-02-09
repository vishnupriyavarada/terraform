# since there is no terraform.tfvars file, here we are having dev.tfvars and prod.tfvars hence you have to pass
# them explicitly in terraform plan and terraform apply. 

#   -var-file=filename  Load variable values from the given file, in addition
#                       to the default files terraform.tfvars and *.auto.tfvars.
#                       Use this option more than once to include more than one
#                       variables file.

# Like terraform plan -var-file=dev\dev.tfvars


environment = "dev"

ingress_var =[
    {
    from_port   = 22 # Start port
    to_port     = 22 # End range port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
      {
    from_port   = 80 # Start port
    to_port     = 80 # End range port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]