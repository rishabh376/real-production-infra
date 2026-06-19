resource "azurerm_resource_group" "myrg" {
  for_each = var.rgjhund

  name     = each.value.rg_name
  location = each.value.rg_location
}