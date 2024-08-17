terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
}

provider "azurerm" {
  features {}
}

locals {
  virtual_network = [{
    name          = "vnet1"
    address_space = ["10.0.0.0/16"]
    # ddos_protection_plan = [{
    #   id     = "/subscriptions/12345678-1234-9876-4563-123456789012/resourceGroups/example-resource-group/providers/Microsoft.Network/ddosProtectionPlans/ddosProtectionPlanValue"
    #   enable = true
    # }]
    # encryption = [{
    #   enforcement = "AllowUnencrypted"
    # }]
    subnet = [{
      name           = "snet1"
      address_prefix = "10.0.1.0/24"
      security_group = null
      },
      {
        name           = "snet2"
        address_prefix = "10.0.1.1/24"
        security_group = null
      }
    ]
  }]
}
resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "South India"
}

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "virtual_network" {
  source              = "../../virtual_network"
  for_each            = { for vnet in local.virtual_network : vnet.name => vnet }
  name                = each.value.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = each.value.address_space
  subnet              = each.value.subnet
}

output "vnet_subnet_ids" {
  value = module.virtual_network.vnet1.subnet_ids[*]
  #value = flatten([for vnet in module.virtual_network : vnet.subnet_ids])
}