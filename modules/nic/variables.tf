variable "nics" {
  type = map(object({
    nic_name    = string
    rg_location = string
    rg_name     = string
    snet_name   = string
    vnet_name   = string
    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
    })
  }))
}