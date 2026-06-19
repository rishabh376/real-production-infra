variable "subbu" {
  type        = string
  description = "yeh meri subscription hai"
}

variable "my_token" {
  type      = string
  sensitive = true
}

variable "rgjhund" {
  type = map(object({
    rg_name     = string
    rg_location = string
  }))
}

variable "vnets" {
  type = map(object({
    vnet_name           = string
    vnet_addresskaspace = list(string)
    rg_name             = string
    rg_location         = string
  }))
}

variable "snets" {
  type = map(object({
    snet_name            = string
    rg_name              = string
    vnet_name            = string
    snet_addressprefixes = list(string)
  }))
}

variable "pips" {
  type = map(object({
    pip_name           = string
    allocationkamethod = string
    rg_name            = string
    rg_location        = string
  }))
}

variable "securitywaale" {
  type = map(object({
    nsg_name    = string
    rg_name     = string
    rg_location = string
    security_rule = object({
      name                       = string
      priority                   = number
      direction                  = string
      access                     = string
      protocol                   = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })
  }))
}

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