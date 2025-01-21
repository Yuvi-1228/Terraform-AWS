resource "aws_security_group" "tf-sg" {
    vpc_id = aws_vpc.tf-vpc.id

    #Ingress Rule 
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
        
    }

    #Egress Rule 
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]


    }
    tags = {
        Name = "tf-sg"
    }
  
}