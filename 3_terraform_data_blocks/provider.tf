provider "aws" {
    region = "ap-south-1"  
}


#why data blocks
#suppose you have one vpc(10.0.0.0/16) and 1 subnet(10.0.1.0/24)--->32-24=8 2^8=()-5 ips reserved(first 4(dns, network, vpc router, future use ) and the last ip(broadcast))
#now you want to create one ec2 inside the subnet of vpc
terraform {
    
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
        
    }
    
    
  }
  
  required_version = "v1.5.5"
  
}