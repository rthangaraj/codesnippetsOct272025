provider "azurerm" {
  features {}
}

module "vnet" {
  source = "./modules/vnet"
  vnets  = var.vnets


}
