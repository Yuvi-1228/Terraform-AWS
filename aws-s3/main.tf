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

resource "aws_s3_bucket" "tfdemobucket123321" {
    bucket = "tfdemobucket123321"
  
}

resource "aws_s3_object" "bucket_data" {
    bucket = aws_s3_bucket.tfdemobucket123321.bucket
    source = "./myfile.txt"
    key = "mydata.txt"
  
}