module "resource-group" {
  source  = "./modules/rg"
  rgjhund = var.rgjhund
}

module "virtual-network" {
  source     = "./modules/vnet"
  vnets      = var.vnets
  depends_on = [module.resource-group]
}

module "subnet" {
  source     = "./modules/snet"
  snets      = var.snets
  depends_on = [module.resource-group, module.virtual-network]
}

module "publicip" {
  source     = "./modules/publicip"
  pips       = var.pips
  depends_on = [module.resource-group]
}

module "nsg" {
  source        = "./modules/nsg"
  securitywaale = var.securitywaale
  depends_on    = [module.resource-group]
}

module "nic" {
  source     = "./modules/nic"
  nics       = var.nics
  depends_on = [module.resource-group, module.subnet]
}



# resource "azurerm_subnet_network_security_group_association" "snetnsg" {
#   subnet_id                 = azurerm_subnet.snet.id
#   network_security_group_id = azurerm_network_security_group.mynsg.id
# }

# resource "azurerm_linux_virtual_machine" "linuxvm" {
#   name                  = "${var.prefix}-machine"
#   resource_group_name   = azurerm_resource_group.myrg.name
#   location              = azurerm_resource_group.myrg.location
#   size                  = "Standard_D2alds_v6"
#   admin_username        = "adminuser"
#   admin_password        = "Password@123"
#   network_interface_ids = [azurerm_network_interface.nic.id]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   disable_password_authentication = "false"

#   source_image_reference {
#     publisher = "Debian"
#     offer     = "debian-13"
#     sku       = "13-gen2"
#     version   = "latest"
#   }
# }

# output "public_ip" {
#   value = azurerm_public_ip.mypip.ip_address
# }

# output "public_ip1" {
#   value = azurerm_public_ip.mypip1.ip_address
# }

# resource "azurerm_linux_virtual_machine" "linuxvm1" {
#   name                  = "${var.prefix}-machine1"
#   resource_group_name   = azurerm_resource_group.myrg.name
#   location              = azurerm_resource_group.myrg.location
#   size                  = "Standard_D2alds_v6"
#   admin_username        = "adminuser1"
#   admin_password        = "Password@123"
#   network_interface_ids = [azurerm_network_interface.nic1.id]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   disable_password_authentication = "false"

#   source_image_reference {
#     publisher = "Debian"
#     offer     = "debian-13"
#     sku       = "13-gen2"
#     version   = "latest"
#   }
# }

# resource "azurerm_linux_virtual_machine" "linuxvm2" {
#   name                  = "${var.prefix}-machine2"
#   resource_group_name   = azurerm_resource_group.myrg.name
#   location              = azurerm_resource_group.myrg.location
#   size                  = "Standard_D2alds_v6"
#   admin_username        = "adminuser2"
#   admin_password        = "Password@123"
#   network_interface_ids = [azurerm_network_interface.nic2.id]

#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   disable_password_authentication = "false"

#   source_image_reference {
#     publisher = "Debian"
#     offer     = "debian-13"
#     sku       = "13-gen2"
#     version   = "latest"
#   }
# }

# resource "azurerm_lb" "mylb" {
#   name                = "${var.prefix}-LoadBalancer"
#   location            = azurerm_resource_group.myrg.location
#   resource_group_name = azurerm_resource_group.myrg.name

#   frontend_ip_configuration {
#     name                 = "${var.prefix}-PublicIPAddress"
#     public_ip_address_id = azurerm_public_ip.mypip.id
#   }
# }

# resource "azurerm_lb_rule" "lbkarule" {
#   name                           = "${var.prefix}-LBRule"
#   protocol                       = "Tcp"
#   frontend_port                  = 80
#   backend_port                   = 3389
#   frontend_ip_configuration_name = azurerm_lb.mylb.frontend_ip_configuration[0].name
#   loadbalancer_id                = azurerm_lb.mylb.id
# }

# resource "azurerm_lb_backend_address_pool" "mylbpool" {
#   name            = "${var.prefix}-BackEndAddressPool"
#   loadbalancer_id = azurerm_lb.mylb.id
# }

# resource "azurerm_network_interface_backend_address_pool_association" "myniclb" {
#   network_interface_id    = azurerm_network_interface.nic.id
#   backend_address_pool_id = azurerm_lb_backend_address_pool.mylbpool.id
#   ip_configuration_name   = azurerm_network_interface.nic.ip_configuration[0].name
# }

# resource "azurerm_lb_probe" "myproba" {
#   name            = "${var.prefix}-ssh-running-probe"
#   port            = 22
#   loadbalancer_id = azurerm_lb.mylb.id
# }

# resource "azurerm_lb_probe" "web_probe" {
#   name            = "${var.prefix}-web-probe"
#   port            = 3389
#   protocol        = "Tcp"
#   loadbalancer_id = azurerm_lb.mylb.id
# }

# resource "azurerm_virtual_machine_extension" "mecontainersetup1" {
#   name                = "hamaarbhachua-mycontainer1"
#   virtual_machine_id  = azurerm_linux_virtual_machine.linuxvm1.id
#   publisher           = "Microsoft.Azure.Extensions"
#   type                = "CustomScript"
#   type_handler_version = "2.0"

#   protected_settings = <<PROTECTED_SETTINGS
# {
#   "commandToExecute": "echo 'Waiting for network...'; while ! curl -s --connect-timeout 10 https://deb.debian.org > /dev/null 2>&1; do echo 'Network not ready, waiting 15s...'; sleep 15; done; echo 'Network ready!'; apt-get update; apt-get install -y docker.io; systemctl enable docker; systemctl start docker; docker login -u rishabh564 -p \"${var.my_token}\"; docker pull rishabh564/myregistry:beta; docker run -d --name meratv -p 3389:80 rishabh564/myregistry:beta"
# }
# PROTECTED_SETTINGS

# timeouts {
#   create = "0.4h"
# }

# }

# resource "azurerm_virtual_machine_extension" "mecontainersetup2" {
#   name                = "hamaarbhachua-mycontainer2"
#   virtual_machine_id  = azurerm_linux_virtual_machine.linuxvm2.id
#   publisher           = "Microsoft.Azure.Extensions"
#   type                = "CustomScript"
#   type_handler_version = "2.0"

#   protected_settings = <<PROTECTED_SETTINGS
# {
#   "commandToExecute": "echo 'Waiting for network...'; while ! curl -s --connect-timeout 10 https://deb.debian.org > /dev/null 2>&1; do echo 'Network not ready, waiting 15s...'; sleep 15; done; echo 'Network ready!'; apt-get update; apt-get install -y docker.io; systemctl enable docker; systemctl start docker; docker login -u rishabh564 -p \"${var.my_token}\"; docker pull rishabh564/myregistry:beta; docker run -d --name meratv -p 3389:80 rishabh564/myregistry:beta"
# }
# PROTECTED_SETTINGS

# timeouts {
#   create = "0.4h"
# }

# }