data "azurerm_public_ip" "pipforbastion" {
  for_each = var.andargusnekadarwaaza

  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}

data "azurerm_subnet" "snetforbastion" {
  for_each = var.andargusnekadarwaaza

  name                 = each.value.snet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}