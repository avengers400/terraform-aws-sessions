provider "aws" {
    region = "ap-south-1"
  
}

# terraform {
#   backend "s3" {
#     bucket = "8764rtyibf"
#     key = "resources/terraform.tfstate"
#     region = "ap-south-1"
#     #lock----then you can restric others ti apply any configuration
#     dynamodb_table = "terraform-lock"
    
#   }

# }
resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = file("./mykey.pub")
  
}
resource "aws_instance" "second-ec2" {
    ami = "ami-084e7e1456028650e"
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykey.key_name
    
    provisioner "remote-exec" {
      connection {
        type = "ssh"
        host = self.public_ip
        user = "root"
        private_key = file("./mykey.pem")
      }
      inline = [
        "sudo yum update -y",
        "sudo yum install nginx -y",
        "sudo service nginx start"
      
    ]
      
    }

    depends_on = [ aws_key_pair.mykey ]
    
  
}

#provisioners----
# ------- remote -exec-->if you have to apply certain installation remotely, then you have to use remote-exec
#         local exec--->suppose you want to sttore the public ip in a tex5 file for reporting purpose locally

# resource "aws_instance" "third-ec2" {
#     ami = "ami-084e7e1456028650e"
#     instance_type = "t2.micro"
    
#     provisioner "local-exec" {
#       command = "echo ${self.public_ip} > ipaddress.txt"
      
#     }
    
  
# }
