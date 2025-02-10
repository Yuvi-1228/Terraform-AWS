output "vpc" {
  value = module.my_vpc.vpc_id
}

output "public_subnet" {
  value = module.my_vpc.public_subnet
}

output "private_subnet" {
  value = module.my_vpc.private_subnet
}
