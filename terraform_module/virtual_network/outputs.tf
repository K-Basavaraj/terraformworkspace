output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "name of the vnet"
}

output "id" {
  value       = azurerm_virtual_network.vnet.id
  description = "id of the vnet"
}

output "resource_group_name" {
  value       = azurerm_virtual_network.vnet.resource_group_name
  description = "name of the resource group"
}

output "location" {
  value       = azurerm_virtual_network.vnet.location
  description = "location where vnet is created"
}

output "subnet_ids" {
  value       = azurerm_virtual_network.vnet.subnet[*].id
  description = "id of this"
}
