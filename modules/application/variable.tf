variable "appgw" {
    type = map(object({
      app_name = string
      location = string
      rg_name = string
      subnet_name = string
      virtual_network_name = string
      pip_name = string

      sku = object({
        sku_name = string
        sku_tire    = string
        capacity = number
      })

      gateway_ip_configuration = object({
         get_ip_name = string 
      })

      frontend_port = object({
        frontend_port_name = string
        frontend_port_port = number
      })

      frontend_ip_configuration = object({
          frontend_ip_configuration_name = string
          })

      backend_address_pool = object({
        backend_address_pool_name = string
      })

      backend_http_settings = object({
        backend_http_settings_name =  string
        cookie_based_affinity = string
        path = string
        backend_http_settings_port =number
        backend_http_settings_protocol =string
        request_timeout = number

      })

       http_listener = object({
         http_listener_name = string
         frontend_ip_configuration_name = string
         frontend_port_name = string
         http_listener_protocol = string
       })

       request_routing_rule  = object({
        request_routing_rule_name = string
        priority = number
        rule_type = string
        http_listener_name = string
        backend_address_pool_name = string
        backend_http_settings_name = string



       })





    }))
  
}