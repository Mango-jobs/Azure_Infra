resource "azurerm_virtual_network" "vnet10" {
  depends_on          = [azurerm_resource_group.ambuj20]
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.name
  address_space       = var.address_space_vnet
}
