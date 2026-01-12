resource "azurerm_network_security_group" "nsg_ssh" {
  depends_on          = [azurerm_resource_group.ambuj20]
  name                = "nsg-ssh"
  location            = var.location
  resource_group_name = var.name
}
resource "azurerm_network_security_rule" "allow_ssh" {
  depends_on = [azurerm_resource_group.ambuj20]
  name       = "Allow-SSH"
  priority   = 100
  direction  = "Inbound"
  access     = "Allow"
  protocol   = "Tcp"

  source_port_range      = "*"
  destination_port_range = "22"

  source_address_prefix      = "*"
  destination_address_prefix = "*"

  resource_group_name         = var.name
  network_security_group_name = azurerm_network_security_group.nsg_ssh.name
}
resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  network_interface_id      = azurerm_network_interface.main.id
  network_security_group_id = azurerm_network_security_group.nsg_ssh.id
}