provider "azurerm" {
  features {}
}

module "vnet" {
  source = "./modules/vnet"
  vnets  = var.vnets
  ddos_protection_plan_name = var.ddos_protection_plan_name
  ddos_protection_plan_enabled = var.ddos_protection_plan_enabled

}
