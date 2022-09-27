provider "azurerm" {
   features {}
}
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "West Europe"
}


resource "azurerm_storage_account" "example" {
  name                     = "storageshrishti"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "aman"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "container"
}

resource "azurerm_storage_blob" "example" {
  name                   = "amansem6.pdf"
  storage_account_name   = azurerm_storage_account.example.name
  storage_container_name = azurerm_storage_container.example.name
  type                   = "Block"
  source                 = "amansem6.pdf"
}