resource "azurerm_public_ip" "VIP10" {
  depends_on          = [azurerm_resource_group.ambuj20]
  name                = var.public_ip_name
  resource_group_name = var.name
  location            = var.location
  allocation_method   = "Static"
}