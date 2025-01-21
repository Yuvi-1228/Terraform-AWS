terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.84.0"
    }
    random = {
      source = "hashicorp/random"
      version = "3.6.3"
    }
  }
}

provider "random" {
  # Configuration options
}

provider "aws" {
  # Configuration options
  region = "us-east-1" #manually single region
  #region = var.region #if you are using multiple task
}

resource "random_id" "tf_random" {
    byte_length = 8
  }

resource "aws_s3_bucket" "tfdemobucket123321" {
    bucket = "tfdemobucket.${random_id.tf_random.hex}" 
}

resource "aws_s3_object" "bucket_data" {
    bucket = aws_s3_bucket.tfdemobucket123321.bucket
    source = "../aws-s3/myfile.txt"
    key = "mydata.txt"
  
}

output "name" {
    value =  random_id.tf_random.hex
  
}