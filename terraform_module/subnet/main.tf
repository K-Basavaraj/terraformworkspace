resource "azurerm_subnet" "subnet" {
  name                                          = var.name
  resource_group_name                           = var.resource_group_name
  virtual_network_name                          = var.virtual_network_name
  address_prefixes                              = var.address_prefixes
  service_endpoints                             = var.service_endpoints
  service_endpoint_policy_ids                   = var.service_endpoint_policy_ids
  private_endpoint_network_policies             = var.private_endpoint_network_policies
  private_link_service_network_policies_enabled = var.private_link_service_network_policies_enabled
  default_outbound_access_enabled               = var.default_outbound_access_enabled
  dynamic "delegation" {
    for_each = [for del in var.delegation : {
      service_name = del.service_name
      actions      = del.actions
    }]
    content {
      name = format("%s${var.separator}%s${var.separator}%s", var.name, "delegation", delegation.key)
      service_delegation {
        name    = delegation.value.service_name
        actions = delegation.value.actions
      }
    }
  }
}
