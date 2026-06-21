data "azurerm_virtual_network" "remote_vnet" {
    for_each = var.vnet_perring
  name                = each.value.remote_vnet_name
  resource_group_name = each.value.remote_resource_group_name
}