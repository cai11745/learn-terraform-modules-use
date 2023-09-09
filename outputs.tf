output "vnet_name" {
  value = azurerm_virtual_network.vnet.name
}

output "resource_group_name" {
  value = module.azure_module.rg_name
}
