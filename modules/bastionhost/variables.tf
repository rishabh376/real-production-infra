variable "andargusnekadarwaaza" {
  type = map(object({
    bastion_name = string
    rg_name      = string
    rg_location  = string
    pip_name     = string
    snet_name    = string
    vnet_name    = string
    ip_configuration = object({
      name = string
    })
  }))
}