variable "vnets" {
  type = map(object({
    location            = string
    address_space       = list(string)
    resource_group_name = string
    subnets = list(object({
      address_prefix = string
    }))
  }))
}


