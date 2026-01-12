resource "azurerm_storage_account" "stg20" {
  depends_on               = [azurerm_resource_group.ambuj20]
  name                     = var.storage_account_name
  resource_group_name      = var.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}
