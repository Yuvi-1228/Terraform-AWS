terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1" #manually single region
  #region = var.region #if you are using multiple task
}

data "aws_ami" "name" {
    most_recent = true
    owners = "amazon"
  
}

output "aws_ami" {
    value = data.aws_ami.name.id
  
}

# Security group data source 
data "aws_security_group" "name" {
    tags = {
      tf-sg = "http"
    }
  
}

output "aws_security_group" {
    value = data.aws_security_group.name.id
  
}

# VPC from data source 
data "aws_vpc" "name" {
    tags = {
      ENV = "PROD"
      name = "tf-vpc"
    }
  
}

output "aws_vpc" {
    value = data.aws_vpc.name.id
  
}

# If you want to know avaibility zone 
data "aws_availability_zones" "names" {
    state = "available"
  
}
output "aws_availability_zones" {
    value = data.aws_availability_zones.names
}

# To get the account the account detail 
data "aws_caller_identity" "name" { 
}
output "caller_info" {
    value = data.aws_caller_identity.name  
}
resource "aws_instance" "tfserver" {
   # ami = "ami-043a5a82b6cf98947" #amazon linux 2
   # ami = "ami-0e1bed4f06a3b463d" #ubuntu 22.0
    ami = data.aws_ami.name.id  # from data source 
    instance_type = "t2.micro"

    tags = {
        Name = "tfserver"
    }
  
}