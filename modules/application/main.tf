resource "azurerm_application_gateway" "appgw" {
    for_each = var.appgw

  name                = each.value.app_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  sku {
    name     = each.value.sku.sku_name
    tier     = each.value.sku.sku_tire
    capacity = each.value.sku.capacity
  }

  gateway_ip_configuration {
    name      = each.value.gateway_ip_configuration.get_ip_name
    subnet_id = data.azurerm_subnet.sub_id[each.key].id
  }

  frontend_port {
    name = each.value.frontend_port.frontend_port_name
    port = each.value.frontend_port.frontend_port_port
  }

  frontend_ip_configuration {
    name                 = each.value.frontend_ip_configuration.frontend_ip_configuration_name
    public_ip_address_id = data.azurerm_public_ip.pip_data[each.key].id
  }

  backend_address_pool {
    name = each.value.backend_address_pool.backend_address_pool_name

  }

  backend_http_settings {
    name                  = each.value.backend_http_settings.backend_http_settings_name
    cookie_based_affinity = each.value.backend_http_settings.cookie_based_affinity
    path                  = each.value.backend_http_settings.path
    port                  = each.value.backend_http_settings.backend_http_settings_port
    protocol              = each.value.backend_http_settings.backend_http_settings_protocol
    request_timeout       = each.value.backend_http_settings.request_timeout
  }

  http_listener {
    name                           = each.value.http_listener.http_listener_name
    frontend_ip_configuration_name = each.value.http_listener.frontend_ip_configuration_name
    frontend_port_name             = each.value.http_listener.frontend_port_name
    protocol                       = each.value.http_listener.http_listener_protocol
  }

  request_routing_rule {
    name                       = each.value.request_routing_rule.request_routing_rule_name
    priority                   = each.value.request_routing_rule.priority
    rule_type                  = each.value.request_routing_rule.rule_type
    http_listener_name         = each.value.request_routing_rule.http_listener_name
    backend_address_pool_name  = each.value.request_routing_rule.backend_address_pool_name
    backend_http_settings_name = each.value.request_routing_rule.backend_http_settings_name
  }
}