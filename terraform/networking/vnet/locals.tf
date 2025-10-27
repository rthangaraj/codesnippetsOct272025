locals {
  vnet_subnet_map = merge([
    for vnet_name, vnet_details in var.vnets : {
      for i, subnet in vnet_details.subnets : 
        "${vnet_name}-${i}" => {
        vnet_name             = vnet_name
        subnet_name           = "${vnet_name}${i}-subnet"
        address_space         = vnet_details.address_space
        resource_group_name   = vnet_details.resource_group_name
        subnet_address_prefix = subnet.address_prefix
      }
    }
  ]...)
}
