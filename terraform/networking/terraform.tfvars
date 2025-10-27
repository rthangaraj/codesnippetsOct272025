variable "vnets" {
  
    test = {
      location            = "West Europe"
      address_space       = ["10.0.0.0/16"]
      resource_group_name = "test01-rg"
      subnets = [
        { address_prefix = "10.0.1.0/24" },
        { address_prefix = "10.0.2.0/24" }
      ]
    },
    dev = {
      location            = "North Europe"
      address_space       = ["10.1.0.0/16"]
      resource_group_name = "test02-rg"
      subnets = [
        { address_prefix = "10.1.1.0/24" },
        { address_prefix = "10.1.2.0/24" }
      ]
    
  }
}


