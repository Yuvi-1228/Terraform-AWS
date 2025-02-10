#for Using Count 
ec2_config = [ {
  ami = "ami-0e1bed4f06a3b463d" # ubuntu
  instance_type = "t2.micro"
}, {
    ami = "ami-043a5a82b6cf98947" # Amazon
    instance_type = "t2.micro"
} ]

#For using Each 
ec2_map = {
  "ubuntu" = {
    ami = "ami-0e1bed4f06a3b463d" # ubuntu
    instance_type = "t2.micro"
    
  },
  "amazon-linux" ={
    ami = "ami-043a5a82b6cf98947" # Amazon
    instance_type = "t2.micro"
  }
}