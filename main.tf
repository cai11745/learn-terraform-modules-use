# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.48.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "azurerm" {
  features {}
}

module "azure_module" {
  source = "./modules/azure-rg"

  resource_group_name = var.rg_name

}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet_name
  address_space       = ["10.0.0.0/16"]
  location            = "westus2"
  resource_group_name = module.azure_module.rg_name
}

