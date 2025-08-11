provider "aws" {
    region = "ap-south-1"
  
}

variable "environment" {
    type = string
    default = "dev"
  
}

resource "aws_instance" "second-ec2" {
    ami = "ami-084e7e1456028650e"
    instance_type = var.environment == "${terraform.workspace}" ? "t2.micro" : "t2.medium"
    
    
    
  
}



