provider "aws" {
    region = "ap-south-1"
  
}

module "ec2" {
    source = "./module/ec2"
  
}

module "vpc" {
    source = "./module/vpc"
  
}