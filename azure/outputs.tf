# Use this output for getting credentials for AKS.
output "aks_cluster_name" {
  value = module.aks.aks_cluster_name
}

output "aks_cluster_resource_group_name" {
  value = azurerm_resource_group.this.name
}

# outputs used for installation of azurefile csi helm release
output "azure_resource_group_name_for_helm" {
  value = azurerm_resource_group.this.name
}

output "azure_storage_account_name_for_helm" {
  value = module.azurefile.azure_storage_account_name
}

output "azure_storage_account_key_for_helm" {
  value     = module.azurefile.azure_storage_account_key
  sensitive = true
}

output "azurefile_share_name_for_helm" {
  value = module.azurefile.azurefile_share_name
}
