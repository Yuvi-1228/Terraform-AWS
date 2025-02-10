terraform {}

locals {
  value = "Hello World"
}
variable "string_list" {
    type = list(string)
    default = [ "server1", "Server2", "Server3" ]

  
}
output "output" {
    #value = upper(local.value)
    #value = startswith(local.value, "Hello")
    #value = split(" ", local.value)
    #value = max (1, 2, 3, 4, 5)
    #value = abs(-15.123) # to give posiytive number 
    #value = length(var.string_list) # to find the length 
    #value = join(":", var.string_list) # join the value 
    #value = contains(var.string_list, "Server") # value is presnet is not 
    value = toset(var.string_list)
}