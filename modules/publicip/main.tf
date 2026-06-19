resource "azurerm_public_ip" "mypip" {
  for_each = var.pips

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg_location
  allocation_method   = each.value.allocationkamethod
}
