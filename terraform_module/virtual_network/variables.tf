variable "name" {
  type        = string
  description = "name of the vnet"
}

variable "resource_group_name" {
  type        = string
  description = "name of the resource group"
}

variable "location" {
  type        = string
  description = "location where resource will be created"
}

variable "address_space" {
  type        = list(string)
  description = "the address space that is used in vnet"
}

variable "dns_servers" {
  type        = list(string)
  description = "List of IP addresses of DNS servers. if no values are specified this will defult to azure DNS."
  default     = null
}

variable "ddos_protection_plan" {
  type = list(object({
    id     = string
    enable = bool
  }))
  default = []
}

variable "encryption" {
  type = list(object({
    enforcement = string
  }))
  default = []
}

variable "subnet" {
  type = list(object({
    name           = string
    address_prefix = string
    security_group = string
  }))
  default = null
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
