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
      id     = ddos_protection_plan.valaue.id
      enable = ddos_protection_plan.valaue.enable
    }
  }
  tags = var.tags
}
