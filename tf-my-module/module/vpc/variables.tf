variable "aws_vpc_config" {
  description = "To get CIDR and Name of VPC from user"
  type = object({
    cidr_block = string
    name       = string
  })
  validation {
    condition     = can(cidrnetmask(var.aws_vpc_config.cidr_block))
    error_message = "Invalid CIDR Format -${var.aws_vpc_config.cidr_block}"
  }

}

variable "subnet_config" {
  description = "To get the subnet"
  #sub1={cidr=.... az=....} sub2{} sub3{}
  type = map(object({
    cidr_block = string
    azs        = string
    public     = optional(bool, false)
  }))
  validation {
    condition     = alltrue([for config in var.subnet_config : can(cidrnetmask(config.cidr_block))])
    error_message = "Invalid CIDR Format"
  }

}

