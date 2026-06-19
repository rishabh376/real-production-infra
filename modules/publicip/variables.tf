variable "pips" {
  type = map(object({
    pip_name           = string
    allocationkamethod = string
    rg_name            = string
    rg_location        = string
  }))
}