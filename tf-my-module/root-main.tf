provider "aws" {
  region = "us-east-1"

}
module "my_vpc" {
  source = "./module/vpc"
  aws_vpc_config = {
    cidr_block = "10.0.0.0/16"
    name       = "my-module-vpc"
  }
  subnet_config = {
    public_subnet = {
      cidr_block = "10.0.1.0/24"
      azs        = "us-east-1a"
      public     = true
    }
    private_subnet = {
      cidr_block = "10.0.2.0/24"
      azs        = "us-east-1b"
    }

  }
}
