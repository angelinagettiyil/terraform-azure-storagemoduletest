resource "azurerm_resource_group" "angel-rg1" {
  name     = var.resourcegroup
  location = "Central India"
}

resource "azurerm_storage_account" "angel-sa" {
  name                     = var.storageaccount
  resource_group_name      = azurerm_resource_group.angel-rg1.name
  location                 = azurerm_resource_group.angel-rg1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "angel-sc" {
  name                  = var.containername
  storage_account_name  = azurerm_storage_account.angel-sa.name
  container_access_type = "private"
}

resource "azurerm_storage_blob" "angelblob" {
  name                   = "angelblob"
  storage_account_name   = azurerm_storage_account.angel-sa.name
  storage_container_name = azurerm_storage_container.angel-sc.name
  type                   = "Block"
  source                 = "C:/Demo5Module/modules/storageaccount/Demo.zip"
}