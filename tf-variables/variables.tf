variable "instance_type" {
    description = "choose your Instance Type"
    type = string
    #default = "t2.micro"
    validation {
      condition = var.nstance_type=="t2.micro" || var.instance_type=="t3.micro"
      error_message = "select one t type of instances"
    }
}
variable "root_volume_size" {
    description = "Enter the volume size in GB"
    type = number
    default = 20
  
}
variable "root_volume_type" {
    description = "Enter the volume type"
    type = string
    validation {
      condition = var.root_volume_type=="gp2" || var.root_volume_type=="gp3"
      error_message = "please select only gp2 or gp3 only"
    }
  
}

# If you want two different categories in one block 
variable "root_block_device" {
    type = object({
      v_size = number
      v_type = string
    })
    default = {
      v_size = 20
      v_type = "gp2"
    }
  
}

# Map Varibale 
variable "additional_tags" {
    type = map(string) # expecting key=value formating
    default = {
    }
  
}

#Environment Variable 
#export TF_VAR_instance_type=t2.micro

