resource "azurerm_kubernetes_cluster" "this" {
  name                = "csi-azurefile"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "csi-azurefile"

  # required kubernetes version under enable azure workload identity
  # see -> https://github.com/Azure/azure-workload-identity
  kubernetes_version = "1.29"

  # Node Pool settings
  default_node_pool {
    name       = "defaultnp"
    node_count = 2
    vm_size    = "Standard_DS2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
