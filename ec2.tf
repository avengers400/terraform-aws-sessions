
terraform {
    
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
        
    }
    
    
  }
  
  required_version = "v1.5.5"
  
}

provider "aws" {
    region = "ap-south-1"
  
}



resource "aws_instance" "demo-ec2" {

    ami = var.insert_ami
    instance_type = var.instancetype
    vpc_security_group_ids = [aws_security_group.test-sg.id]
    tags = {
        "Name": "test-ec2"
    }

    depends_on = [ aws_security_group.test-sg ]
    
  
}

resource "aws_security_group" "test-sg" {

    name = "test-sg"
    description = "for testing purpose"
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}

