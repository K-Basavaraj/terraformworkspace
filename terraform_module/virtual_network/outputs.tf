output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "name of the vnet"
}

output "id" {
  value       = azurerm_virtual_network.vnet.id
  description = "id of the vnet"
}
