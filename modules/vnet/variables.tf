variable "vnets" {
  type = map(object(
    {
      vnet_name           = string
      vnet_addresskaspace = list(string)
      rg_name             = string
      rg_location         = string
    }
  ))
}