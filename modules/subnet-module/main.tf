terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.subnet_rg_name
  virtual_network_name = var.subnet_vnet_name
  address_prefixes     = var.subnet_address_prefixes
}