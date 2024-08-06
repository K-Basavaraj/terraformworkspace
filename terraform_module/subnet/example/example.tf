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
  subnet = [{
    name             = "snet1"
    address_prefixes = ["10.0.1.0/24"]
    # delegation = [{
    #     service_name = "Microsoft.Web/serverFarms"
    #     actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
    #   }]
    #delegation = []
    }
  ]
}
resource "azurerm_resource_group" "rg" {
  name     = "example-resources"
  location = "South India"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "example-vnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
}

module "subnet" {
  for_each             = { for snet in local.subnet : snet.name => snet }
  source               = "../"
  name                 = each.value.name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes
  #delegation           = each.value.delegation
}
