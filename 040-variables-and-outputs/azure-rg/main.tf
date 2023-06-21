locals {
  project_name = "terraform_101"
}

resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
  tags = {
    "owner"   = var.tag_owner_value
    "project" = "project_${local.project_name}"
  }
}
