# Create a virtual network within the resource group
resource "azurerm_virtual_network" "staging" {
  name                = "staging-network"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  address_space       = ["10.0.0.0/23"]
}

resource "azurerm_subnet" "public" {
  name                 = "public-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.staging.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "private" {
  name                 = "private-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.staging.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_nat_gateway" "staging-nat" {
  name                = "staging-nat"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location

tags = {
    environment = "staging"
  }
}
