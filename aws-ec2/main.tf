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
  #region = "us-east-1" #manually single region
  region = var.region #if you are using multiple task
}

resource "aws_instance" "tfserver" {
   # ami = "ami-043a5a82b6cf98947" #amazon linux 2
    ami = "ami-0e1bed4f06a3b463d" #ubuntu 22.0
    instance_type = "t2.micro"

    tags = {
        Name = "tfserver"
    }
  
}