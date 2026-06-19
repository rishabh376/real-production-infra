variable "snets" {
  type = map(object(
    {
      snet_name            = string
      rg_name              = string
      vnet_name            = string
      snet_addressprefixes = list(string)
    }
  ))
}