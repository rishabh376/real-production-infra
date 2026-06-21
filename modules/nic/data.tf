data "azurerm_subnet" "snetfornic" {
  for_each = var.nics

  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}