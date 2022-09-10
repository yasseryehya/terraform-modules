output vnet_name {
  value       = azurerm_virtual_network.vnet.name
  description = "vnet name to be used by other resources when a vnet is created via the vnet-module"
}
