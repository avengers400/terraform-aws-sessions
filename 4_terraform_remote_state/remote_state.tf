provider "aws" {
    region = "ap-south-1"
  
}

terraform {
  backend "s3" {
    bucket = "8764rtyibf"
    key = "resources/terraform.tfstate"
    region = "ap-south-1"
    
  }

}

resource "aws_instance" "second-ec2" {
    ami = "ami-084e7e1456028650e"
    instance_type = "t2.micro"
    
  
}