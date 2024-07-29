terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "labresgrp1"
    storage_account_name = "stgaccstate101"
    container_name       = "statefilecotainer"
    key                  = "devfile.tfstate"
  }
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
