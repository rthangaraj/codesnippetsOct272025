This module will provision the Virtual network in Azure across 2 different regions North Europe and West Europe and under each network we can create multiple subnets. This has been done by creating a variable vnets which holds vnet and subnets information. Also declared a local variable to flatten the Vnet and subnet datstructure for cleaner for_each usage.

For the given input,
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

the locals will be flattened for the test-vnet like,


{
  "test-0" = {
    vnet_name             = "test-vnet"
    subnet_name           = "testvnet0-subnet"
    address_space         = ["10.0.0.0/16"]
    resource_group_name   = "test01-rg"
    subnet_address_prefix = "10.0.1.0/24"
  },
  "test-1" = {
    vnet_name             = "test-vnet"
    subnet_name           = "testvnet1-subnet"
    address_space         = ["10.0.0.0/16"]
    resource_group_name   = "test01-rg"
    subnet_address_prefix = "10.0.2.0/24"
  }
}


NOTE:
DDOS protection plan, NSG, network watcher, service endpoints are out of scope to this module.



