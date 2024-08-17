resource "azurerm_virtual_network" "vnet" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  address_space       = var.address_space
  dns_servers         = var.dns_servers
  dynamic "ddos_protection_plan" {
    for_each = [for ddos in var.ddos_protection_plan :
      {
        id     = ddos.id
        enable = ddos.enable
      }
    ]
    content {
      id     = ddos_protection_plan.value.id
      enable = ddos_protection_plan.value.enable
    }
  }
  dynamic "encryption" {
    for_each = var.encryption
    content {
      enforcement = encryption.value.enforcement
    }
  }
  dynamic "subnet" {
    for_each = var.subnet != null ? var.subnet : []
    content {
      name           = subnet.value.name
      address_prefix = subnet.value.address_prefix
      security_group = subnet.value.security_group
    }
  }
  tags = var.tags
}
