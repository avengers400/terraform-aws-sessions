terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
}
provider "aws" {
    region = var.region
    # access_key = ""
    # secret_key = ""
  
}

variable "region" {
    default = "ap-south-1"
    type = string
  
}
variable "ami" {
    type = map
    default = {
        "us-east-1": "ami-123",
        "us-east-2": "ami-345",
        "ap-south-1": "ami-084e7e1456028650e"
    }
}
variable "tags" {
    type = list
    default = ["first-ec2", "second-ec2", "third-ec2"]
}


# i want to create three instances and each should have a unique and there should be a map of ami
#and according to the region it should select the ami. the count should not be static rather it should
#be dynamically taken
resource "aws_instance" "demo-ec2" {

    ami = lookup(var.ami, var.region)#ami-084e7e1456028650e# lookup({"us-east-1": "ami-123","us-east-2": "ami-345","ap-south-1": "ami-084e7e1456028650e"}, key=us-east-1)
    instance_type = "t2.micro"
    count = length(var.tags)
    tags = {
      "Name": element(var.tags, count.index) #)(["first-ec2", "second-ec2", "third-ec2"], 2)
    }
  
}

output "ec2_public_ip" {
    value = aws_instance.demo-ec2[*].public_ip
  
}

output "instance_ids" {
    value = aws_instance.demo-ec2[*].id
  
}
