resource "azurerm_bastion_host" "host-bas" {
  for_each = var.andargusnekadarwaaza

  name                = each.value.bastion_name
  resource_group_name = each.value.rg_name
  location            = each.value.rg.location

  ip_configuration {
    name                 = each.value.ip_configuration.name
    subnet_id            = data.azurerm_subnet.subnet_id
    public_ip_address_id = data.azurerm
  }

}

