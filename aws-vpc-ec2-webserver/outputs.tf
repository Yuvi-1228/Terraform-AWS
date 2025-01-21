output "aws_instance_public_ip" {
    description = "The Public of EC2 instances"
    value = aws_instance.tf-web-server.public_ip
}

output "aws_instance_url" {
    description = "The URL access to Httdp"
    value = "http://${aws_instance.tf-web-server.public_ip}"
  
}