terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.92.0"
    }
  }
}

provider "azurerm" {
  features {}
}

module "vnet" {
  source             = "./modules/vnet-module"
  vnet_name          = "vnet"
  vnet_rg_name       = "vnet_resource_group"
  vnet_address_space = ["10.0.0.0/16"]
  vnet_location      = "East US"
}

module "subnet1" {
  source                  = "./modules/subnet-module"
  subnet_name             = "subnet1"
  subnet_rg_name          = "vnet_resource_group"
  subnet_vnet_name        = azurerm_virtual_network.vnet.name
  subnet_address_prefixes = ["10.0.1.0/24"]
}

module "subnet2" {
  source                  = "./modules/subnet-module"
  subnet_name             = "subnet2"
  subnet_rg_name          = "vnet_resource_group"
  subnet_vnet_name        = azurerm_virtual_network.vnet.name
  subnet_address_prefixes = ["10.0.2.0/24"]
}