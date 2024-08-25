resource_groups = ["mtrgqaenv"]
location        = "South India"
virtual_network = [{
  name          = "qa-vnet"
  address_space = ["10.1.0.0/16"]
}]
subnet = [{
  name                 = "qa-snet"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = "qa-vnet"
  # delegation = [{
  #   service_name = "Microsoft.Web/serverFarms"
  #   actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
  # }]
}]
