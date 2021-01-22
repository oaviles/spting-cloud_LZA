# Jump host TF Module
# Subnet for jump_host
resource "azurerm_subnet" "jump_host" {
    name                        = "jumphost-subnet"
    resource_group_name         = var.resource_group_name
    virtual_network_name        = var.jump_host_vnet_name
    address_prefixes            = [var.jump_host_addr_prefix]
}

# NIC for jump_host

resource "azurerm_network_interface" "jump_host" { 
    name                              = "${var.jump_host_name}-nic"
    location                          = var.location
    resource_group_name               = var.resource_group_name
    
    ip_configuration { 
        name                          = "configuration"
        subnet_id                     = azurerm_subnet.jump_host.id 
        private_ip_address_allocation = "Static"
        private_ip_address            = var.jump_host_private_ip_addr
    }
}

# NSG for jump_host Subnet

resource "azurerm_network_security_group" "jump_host" { 
    name                        = "jumphost-subnet-nsg"
    location                    = var.location
    resource_group_name         = var.resource_group_name
}

resource "azurerm_subnet_network_security_group_association" "jumphost_nsg_assoc" {
  subnet_id                 = azurerm_subnet.jump_host.id 
  network_security_group_id = azurerm_network_security_group.jump_host.id
}

# Virtual Machine for jump_host 

resource "azurerm_virtual_machine" "jump_host" {
  name                  = var.jump_host_name 
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [ 
        azurerm_network_interface.jump_host.id
    ]
  vm_size               = var.jump_host_vm_size

  storage_image_reference {
    publisher = "MicrosoftWindowsDesktop"
    offer     = "Windows-10"
    sku       = "19h2-pro-g2"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.jump_host_name}-os-disk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  os_profile {
    computer_name      = var.jump_host_name
    admin_username     = var.jump_host_admin_username
    admin_password     = var.jump_host_password

  }

  os_profile_windows_config {
  }

  timeouts {
      create = "60m"
      delete = "2h"
  }

}
