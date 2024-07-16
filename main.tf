# main.tf

# Define the provider
provider "azurerm" {
  features {}
}

# Define the resource group
resource "azurerm_resource_group" "Test" {
  name     = "Test_group"
  location = "Brazil"
}

# Define the virtual network
resource "azurerm_virtual_network" "TestVnet" {
  name                = "Brazil-TestVnet"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.Brazil.location
  resource_group_name = azurerm_resource_group.Test.name
}

# Define a subnet within the virtual network
resource "azurerm_subnet" "TestSubnet" {
  name                 = "Test-subnet"
  resource_group_name  = azurerm_resource_group.Test.name
  virtual_network_name = azurerm_virtual_network.TestVnet.name
  address_prefixes     = ["10.0.1.0/24"]
}