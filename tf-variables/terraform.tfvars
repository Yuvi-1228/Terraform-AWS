instance_type = "t2.micro"
root_block_device = {
  v_size = 30
  v_type = "gp3"
}
additional_tags = {
  Dept = "cloud"
  PROJECT = "terraform"
  }