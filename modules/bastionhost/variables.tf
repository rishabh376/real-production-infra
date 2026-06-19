variable "andargusnekadarwaaza" {
  type = map(object({
    bastion_name = string
    rg_name      = string
    rg_location  = string
    ip_configuration = object({
      name = string
    })
  }))
}