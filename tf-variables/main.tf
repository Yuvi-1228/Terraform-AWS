terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
  }
}

provider "aws" {
    region = "us-east-1" #manually single region
}
#If any task which repeat multiple then we sue local variable
    locals {
      onwer = "ABC"
      Name = "Myserver"
    }

resource "aws_instance" "tfserver" {
   # ami = "ami-043a5a82b6cf98947" #amazon linux 2
    ami = "ami-0e1bed4f06a3b463d" #ubuntu 22.0
    instance_type = var.instance_type

    root_block_device {
        delete_on_termination = true
        volume_size = var.root_block_device.v_size 
        volume_type = var.root_block_device.v_type
    }

    # tags = {
    #     Name = "tfserver"
    # }
    
    # tags = merge(var.additional_tags,{
    #     Name = "tfserver"
    # })
  tags = merge(var.additional_tags,{
        Name = locals.Name
     })
}