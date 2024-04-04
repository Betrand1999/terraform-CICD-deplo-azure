provider "azurerm" {
  features {}
}

# Import existing resource group
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
}

resource "azurerm_storage_account" "example" {
  name                     = "mystorageaccount123"  # Unique name for the storage account
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "dev"
  }
}
