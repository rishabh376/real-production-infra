resource "azurerm_virtual_network" "meravnet" {
  for_each = var.vnets

  name                = each.value.vnet_name
  address_space       = each.value.vnet_addresskaspace
  location            = each.value.rg_location
  resource_group_name = each.value.rg_name

}
