terraform {}

#Number List 
variable "num_list" {
  type    = list(number)
  default = [1, 2, 3, 4, 5]
}

#Object List of person 
variable "person_list" {
  type = list(object({
    fname = string
    lname = string
  }))
  default = [{
    fname = "person1f"
    lname = "person1l"
    }, {
    fname = "person2f"
    lname = "person2l"
  }]
}

#map list 
variable "map_list" {
  type = map(number)
  default = {
    "one"   = 1
    "two"   = 2
    "three" = 3
  }

}
#calculation and operator 
locals {
  mul = 2 * 2
  add = 2 + 2
  eq  = 2 != 3

  #double list 
  double = [for num in var.num_list : num * 2]
  #to find out odd number 
  odd = [for num in var.num_list : num if num % 2 != 0]

# to get only fname person list 
fname_list = [ for person in var.person_list: person.fname]
lname_list = [ for person in var.person_list: person.lname]

#working with map 
maplist_key = [for key, value in var.map_list: key]
maplist_value = [for key, value in var.map_list: value]

#double map 
double_map = {for key, value in var.map_list: key => value*2}
}

output "op_exp_output" {
  value = local.double_map
}

# output "op_exp_output" {
#     value = var.num_list

# }

