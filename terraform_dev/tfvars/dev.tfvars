resource_groups = ["mytestrg101"]
location        = "South India"
virtual_network = [{
  name          = "vnet1"
  address_space = ["10.0.0.0/16"]
}]
subnet = [{
  name                 = "snet1"
  address_prefixes     = ["10.0.1.0/24"]
  virtual_network_name = "vnet1"
  # delegation = [{
  #   service_name = "Microsoft.Web/serverFarms"
  #   actions      = ["Microsoft.Network/virtualNetworks/subnets/action"]
  # }]
}]
