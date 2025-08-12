resource "aws_instance" "my-ec2" {
    ami = "ami-084e7e1456028650e"
    instance_type = "t2.micro"
    tags = {
        Name = "MyEC2Instance"
    }
}