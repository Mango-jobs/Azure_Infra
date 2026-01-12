resource "azurerm_subnet" "subnet10" {
  depends_on           = [azurerm_virtual_network.vnet10]
  name                 = var.subnet_name
  resource_group_name  = var.name
  virtual_network_name = var.virtual_network_name
  address_prefixes     = var.subnet_pool
}
