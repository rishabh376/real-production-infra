resource "azurerm_network_interface" "nic" {
  for_each = var.nics

  name                = each.value.nic_name
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                          = each.value.ip_configuration.name
    subnet_id                     = data.azurerm_subnet.snetfornic[each.key].id
    private_ip_address_allocation = each.value.ip_configuration.private_ip_address_allocation
    # public_ip_address_id = azurerm_public_ip.mypip1.id
  }
}

