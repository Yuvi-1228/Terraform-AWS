# Create VPC 
resource "aws_vpc" "tf-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "tf-vpc"
    }
  
}

# Create Subnet Public and Private 
resource "aws_subnet" "public-subnet" {
    cidr_block = "10.0.1.0/24"
    vpc_id = aws_vpc.tf-vpc.id
    tags = {
      Name = "public-subnet"
    }
  
}
resource "aws_subnet" "private-subnet" {
    cidr_block = "10.0.2.0/24"
    vpc_id = aws_vpc.tf-vpc.id
    tags = {
      Name = "private-subnet"
    }
  
}

# Create Internet Gateway
resource "aws_internet_gateway" "tf-igw" {
    vpc_id = aws_vpc.tf-vpc.id
    tags = {
      Name = "tf-igw"
    }
  
}

# Route Table 
resource "aws_route_table" "tf-rt" {
    vpc_id = aws_vpc.tf-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf-igw.id
    }
  
}

# Route Associate 
resource "aws_route_table_association" "public-associate" {
    route_table_id = aws_route_table.tf-rt.id
    subnet_id = aws_subnet.public-subnet.id
  
}