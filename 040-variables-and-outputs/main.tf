terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}


module "azure-rg" {
  source          = "./azure-rg"
  tag_owner_value = "penghao-out-of-module"
}

output "location" {
  value = module.azure-rg.location
}

data "azurerm_resource_group" "NetworkWatcher" {
  name = "NetworkWatcherRG"
}

output "resource_group_location" {
  value = data.azurerm_resource_group.NetworkWatcher.location
}

