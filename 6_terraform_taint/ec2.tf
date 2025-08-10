# terraform taint/replace concept
# you have applied taint on certain resource which is already create---terraform apply--even if you resource is present, it will delete and recre
# teraform init
# terraform plan
# terraform apply -auto-approve
# terraform apply replace aws_instance" "third-ec2



provider "aws" {
    region = "ap-south-1"
  
}



resource "aws_instance" "second-ec2" {
    ami = "ami-084e7e1456028650e"
    instance_type = "t2.micro"
    
    
    
  
}


resource "aws_instance" "third-ec2" {
    ami = "ami-084e7e1456028650e"
    instance_type = "t2.micro"
    
    
      
    
    
  
}
