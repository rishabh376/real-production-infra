resource "azurerm_virtual_network_peering" "vnet1" {
    for_each = var.vnet_perring
  name                      = each.value.vnet_parring_name
  resource_group_name       = each.value.resource_group_name
  virtual_network_name      = each.value.vnet_name
  remote_virtual_network_id = data.azurerm_virtual_network.remote_vnet[each.key].id
}
