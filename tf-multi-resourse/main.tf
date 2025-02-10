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
 
}

locals {
  project = "multi_project"
}

resource "aws_vpc" "multi_vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "${local.project}-vpc"
    }
}

resource "aws_subnet" "multi_subnet" {
    vpc_id = aws_vpc.multi_vpc.id
    cidr_block = "10.0.${count.index}.0/24"
    count = 2 
    tags = {
      Name = "${local.project}-subnet-${count.index}"
    }
}

# create EC2 within subnet
resource "aws_instance" "main" {
    #For Using Count 

    #count = length(var.ec2_config)
    #ami = var.ec2_config[count.index].ami
    #instance_type = var.ec2_config[count.index].instance_type
    #subnet_id = element(aws_subnet.multi_subnet[*].id, count.index % length(aws_subnet.multi_subnet))
    
    #For using Each

    for_each = var.ec2_map # we will get each.key and each.value
    ami = each.value.ami
    instance_type = each.value.instance_type
    subnet_id = element(aws_subnet.multi_subnet[*].id, index(keys(var.ec2_map), each.key) % length(aws_subnet.multi_subnet))

    # For Normal using multiple resource 

    # ami = "ami-0e1bed4f06a3b463d" #ubuntu 22.0
    # instance_type = "t2.micro"
    # count = 4 
    # subnet_id = element(aws_subnet.multi_subnet[*].id, count.index % length(aws_subnet.multi_subnet))

    tags = {
     # Name = "${local.project}-instance-${count.index}" # For count using 
     Name = "${local.project}-instance-${each.key}" # For Each using 
    }
  
}

output "aws_subnet_id" {
    #value = aws_subnet.multi_subnet[0].id
    value = aws_subnet.multi_subnet[1].id
  
}