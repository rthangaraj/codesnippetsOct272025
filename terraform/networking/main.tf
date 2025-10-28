provider "azurerm" {
  features {}
}

module "vnet" {
  source = "./vnet"
  vnets  = var.vnets


}
