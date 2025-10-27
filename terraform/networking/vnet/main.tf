


resource "azurerm_virtual_network" "vnet" {
  for_each            = var.vnets
  name                = "${each.key}-vnet"
  address_space       = each.value.address_space
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags = {
    environment = "Test"
  }
  ddos_protection_plan {
    id     = azurerm_network_ddos_protection_plan.ddos.id
    enable = var.ddos_protection_plan_enabled
  }
}

resource "azurerm_subnet" "subnet" {
  for_each              = local.vnet_subnet_map
  name                  = each.value.subnet_name
  resource_group_name   = each.value.resource_group_name
  virtual_network_name  = azurerm_virtual_network.vnet[each.value.vnet_name].name
  address_prefix        = each.value.subnet_address_prefix
  enforce_private_link_endpoint_network_policies = true
  tags = {
    environment = "Test"
  }
}
