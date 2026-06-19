variable "nics" {
  type = map(object({
    name        = string
    rg_location = string
    rg_name     = string
    ip_configuration = object({
      name                          = string
      private_ip_address_allocation = string
    })
  }))
}