terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.113.0"
    }
  }
  # backend "azurerm" {
  #   resource_group_name  = "labresgrp1"
  #   storage_account_name = "stgaccstate101"
  #   container_name       = "devcontainer"
  #   key                  = "devfile.tfstate"
  # }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource_group" {
  name     = var.resource_group_name
  location = var.location
}
