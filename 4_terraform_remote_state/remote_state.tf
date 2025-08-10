provider "aws" {
    region = "ap-south-1"
  
}
#Make sure you create your bucket in aws
terraform {
  backend "s3" {
    bucket = "8764rtyibf"
    key = "resources/terraform.tfstate"
    region = "ap-south-1"
    #lock----then you can restric others to apply any configuration
    dynamodb_table = "terraform-lock"
    
  }

}

resource "aws_instance" "second-ec2" {
    ami = "ami-084e7e1456028650e"
    instance_type = "t2.micro"
    
    
      
    
  
}

#provisioners----
# ------- remote -exec-->if you have to apply certain installation remotely, then you have to use remote-exec
#         local exec--->suppose you want to sttore the public ip in a tex5 file for reporting purpose locally