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
        name  = "vnet1"
        address_space = ["10.0.0.0/16"]
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
  source               = "../../virtual_network"
  for_each             = { for vnet in local.virtual_network : vnet.name => vnet }
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.rg.name
  location             = azurerm_resource_group.rg.location
  address_space        = each.value.address_space
  #dns_servers          = each.value.dns_servers
  #ddos_protection_plan = each.value.ddos_protection_plan
  #tags                 = each.value.tags
}
