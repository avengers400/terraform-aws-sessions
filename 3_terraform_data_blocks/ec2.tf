
data "aws_vpc" "demo-vpc" {
    filter {
      name = "tag:Name"
      values = ["my-vpc"]
    }

  
}

data "aws_subnet" "subnet_1" {
   filter {
     name = "tag:Name"
     values = ["subnet-1"]
   }
}


resource "aws_instance" "my-ec2" {

    ami = "ami-084e7e1456028650e"
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.subnet_1.id
    tags = {
      "Name": "first-ec2"
    }

  
}