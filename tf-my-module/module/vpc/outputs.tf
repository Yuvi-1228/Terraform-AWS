#VPC
output "vpc_id" {
  value = aws_vpc.main.id
}

#locals
#to format the subnet ID which may be multiples in format of subnet_name= {id = , az= }
locals {
  public_subnet_output = {
    for key, config in local.public_subnet : key => {
      subnet_id = aws_subnet.subnetname[key].id
      azs       = aws_subnet.subnetname[key].availability_zone
    }
  }
  private_subnet_output = {
    for key, config in local.private_subnet : key => {
      subnet_id = aws_subnet.subnetname[key].id
      azs       = aws_subnet.subnetname[key].availability_zone
    }
  }
}

#Subnet Detail 
output "public_subnet" {
  value = local.public_subnet_output

}
output "private_subnet" {
  value = local.private_subnet_output

}
