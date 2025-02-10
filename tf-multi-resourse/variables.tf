#for Using Count
# EC2 Variable 
variable "ec2_config" {
    type = list(object({
      ami = string
      instance_type = string
    }))
  
}
#for using Each
variable "ec2_map" {
    # key = value[object{ami, instance}]
    type = map(object({
      ami = string
      instance_type = string
    }))
  
}
