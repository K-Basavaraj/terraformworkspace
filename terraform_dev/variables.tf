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
