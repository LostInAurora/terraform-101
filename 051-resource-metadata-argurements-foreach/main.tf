# Configure the Azure provider
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

locals {
  project_name = "terraform_101"
}


variable "tag_owner_value" {
  type    = string
  default = "pengha"
}

resource "azurerm_resource_group" "example" {
  name     = "myTFResourceGroup"
  location = "westus2"
  tags = {
    "owner"   = var.tag_owner_value
    "project" = "project_${local.project_name}"
  }
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_virtual_network" "example" {
  for_each = {
    index1 = 1
    index2 = 2
  }
  name                = "example-network-${each.value}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }
  depends_on = [
    azurerm_resource_group.example
  ]
}
output "vnet_names" {
  value = values(azurerm_virtual_network.example)[*].name
}