module "azurefile_csi" {
  source = "./azurefile-csi"

  azure_resource_group_name       = var.azure_resource_group_name_for_helm
  azure_storage_account_name      = var.azure_storage_account_name_for_helm
  azure_storage_account_key       = var.azure_storage_account_key_for_helm
  azurefile_share_name            = var.azurefile_share_name_for_helm
}
