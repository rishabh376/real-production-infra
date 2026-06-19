data "subnet_id" "ids" {
  for_each = azurerm_subnet
  value    = azurerm_subnet.subnet_id
}