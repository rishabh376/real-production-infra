
resource "azurerm_user_assigned_identity" "user_id" {
    for_each = var.server
  name                = each.value.user_name
  location            = each.value.location
  resource_group_name = each.value.rg_name
}



resource "azurerm_mssql_server" "server" {
    for_each = var.server
  name                         = each.value.server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version 
  administrator_login          = each.value.administrator_login
  administrator_login_password = each.value.administrator_login_password
  minimum_tls_version          = each.value.minimum_tls_version 

  azuread_administrator {
    login_username = azurerm_user_assigned_identity.user_id[each.key].name
    object_id      = azurerm_user_assigned_identity.user_id[each.key].principal_id
  }

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.user_id[each.key].id]
  }

  primary_user_assigned_identity_id            = azurerm_user_assigned_identity.user_id[each.key].id
}

