# Whatever value we giver here it will take from here 
#High priority
#Environment varibal >> terraform.tfvars >> *.auto.tfvars >> 

root_block_device = {
  v_size = 30
  v_type = "gp3"
}
