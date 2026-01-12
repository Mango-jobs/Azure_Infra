resource "azurerm_network_interface" "main" {
  name                = var.network_interface_name
  location            = var.location
  resource_group_name = var.name

  ip_configuration {
    name                          = "ambujip10"
    subnet_id                     = azurerm_subnet.subnet10.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.VIP10.id
  }
}

resource "azurerm_virtual_machine" "ambuj20vm" {
  depends_on            = [azurerm_resource_group.ambuj20]
  name                  = var.virtual_machine_name
  location              = var.location
  resource_group_name   = var.name
  network_interface_ids = [azurerm_network_interface.main.id]
  vm_size               = "Standard_D2ls_v5"

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "ambuj20"
    admin_username = "ambuj20"
    admin_password = "ambuj@123"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}