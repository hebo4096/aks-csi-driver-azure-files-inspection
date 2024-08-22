resource "helm_release" "azurefile_csi" {
  name  = "azurefile-csi"
  chart = "${path.root}/helm-chart"

  set {
    name = "csi.azureResourceGroupName"
    value = var.azure_resource_group_name
  }

  set {
    name = "csi.azureStorageAccountName"
    value = var.azure_storage_account_name
  }

  set {
    name = "csi.azureStorageAccountKey"
    value = var.azure_storage_account_key
  }

  set {
    name = "csi.azureFileShareName"
    value = var.azurefile_share_name
  }
}
