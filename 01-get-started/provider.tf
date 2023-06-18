# Configure the Azure provider
terraform {
  cloud {
    organization = "shipenghao19961225"

    workspaces {
      name = "terraform-get-started"
    }
  }
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
