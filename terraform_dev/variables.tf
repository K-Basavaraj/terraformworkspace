variable "resource_groups" {
  type = list(string)
}

variable "location" {
  type = string
}

variable "virtual_network" {
  type = list(object({
    name          = string
    address_space = list(string)
  }))
}

variable "subnet" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
    # delegation = list(object({
    #   service_name = string
    #   actions      = list(string)
    # }))
  }))
}
