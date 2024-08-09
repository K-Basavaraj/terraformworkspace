# Name of the subnet
variable "name" {
  description = "The name of the subnet."
  type        = string
}

# The name of the resource group in which to create the subnet
variable "resource_group_name" {
  description = "The name of the resource group in which to create the subnet."
  type        = string
}

# The name of the virtual network to which to attach the subnet
variable "virtual_network_name" {
  description = "The name of the virtual network to which to attach the subnet."
  type        = string
}

# The address prefixes to use for the subnet
variable "address_prefixes" {
  description = "The address prefixes to use for the subnet."
  type        = list(string)
}

# A list of service endpoints to be enabled on the subnet
variable "service_endpoints" {
  description = "A list of service endpoints to be enabled on the subnet."
  type        = list(string)
  default     = []
}

# The list of IDs of Service Endpoint Policies to associate with the subnet
variable "service_endpoint_policy_ids" {
  description = "The list of IDs of Service Endpoint Policies to associate with the subnet."
  type        = list(string)
  default     = []
}

# Enable or disable network policies for the private endpoint on the subnet
variable "private_endpoint_network_policies" {
  description = "Enable or disable network policies for the private endpoint on the subnet."
  type        = string
  default     = "Disabled"
}

# Enable or disable network policies for the private link service on the subnet
variable "private_link_service_network_policies_enabled" {
  description = "Enable or disable network policies for the private link service on the subnet."
  type        = bool
  default     = false
}

# Enable default outbound access to the internet for the subnet
variable "default_outbound_access_enabled" {
  description = "Enable default outbound access to the internet for the subnet."
  type        = bool
  default     = true
}

variable "separator" {
  type        = string
  description = "The separtor char to use in the name of the service delagation, if present."
  default     = "-"
}
# Delegation block for the subnet
variable "delegation" {
  description = "One or more delegation blocks for the subnet."
  type = list(object({
    service_name = string
    actions      = list(string)
  }))
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}
