resource "aws_instance" "tf-web-server" {
   # ami = "ami-043a5a82b6cf98947" #amazon linux 2
    ami = "ami-0e1bed4f06a3b463d" #ubuntu 22.0
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public-subnet.id
    vpc_security_group_ids = [ aws_security_group.tf-sg.id ]
    associate_public_ip_address = true
    user_data = <<-EOF
                #!/bin/bash
                sudo yum update -y 
                sudo yum install httpd -y 
                sudo systemctl start httpd 
            EOF

    tags = {
        Name = "tf-web-server-server"
    }
  
}