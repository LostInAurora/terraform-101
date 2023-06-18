resource "azurerm_resource_group" "rg" {
  name     = "myTFResourceGroup"
  location = "westus2"
  tags = {
    "owner"   = var.tag_owner_value
    "project" = "project_${local.project_name}"
  }
}

module "vnet" {
  source              = "Azure/vnet/azurerm"
  version             = "4.1.0"
  resource_group_name = azurerm_resource_group.rg.name
  use_for_each        = true
  vnet_location       = azurerm_resource_group.rg.location
}