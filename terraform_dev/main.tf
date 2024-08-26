terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source              = "../terraform_module/resource_group"
  for_each            = toset(var.resource_groups)
  resource_group_name = each.key
  location            = var.location
}

module "vnet" {
  source              = "../terraform_module/virtual_network"
  for_each            = { for vnet in var.virtual_network : vnet.name => vnet }
  name                = each.value.name
  resource_group_name = module.resource_group["mytestrg101"].name
  location            = module.resource_group["mytestrg101"].location
  address_space       = each.value.address_space
  depends_on = [
    module.resource_group
  ]
}

module "subnet" {
  for_each             = { for snet in var.subnet : snet.name => snet }
  source               = "../terraform_module/subnet"
  name                 = each.value.name
  resource_group_name  = module.resource_group["mytestrg101"].name
  virtual_network_name = module.vnet["vnet1"].vnet_name
  address_prefixes     = each.value.address_prefixes
  depends_on = [
    module.vnet
  ]
}