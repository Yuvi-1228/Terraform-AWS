module "ec2-instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "5.7.1"

  name = "single-instance"


  instance_type          = "t2.micro"
  ami                    = "ami-043a5a82b6cf98947"
  key_name               = "user1"
  #monitoring             = true
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id              = module.vpc.public_subnets[0]

  tags = {
    Name = "ec2-module"
    Environment = "dev"
  }
}