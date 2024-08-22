data "azurerm_client_config" "current_context" {}

resource "azurerm_resource_group" "this" {
  name     = "aks-azurefile-csi-rg-${var.location}"
  location = var.location
}

# modules related to Azure Kubernetes Service (AKS)
module "aks" {
  source = "./modules/aks"

  rg_name  = azurerm_resource_group.this.name
  location = var.location
}

# modules related to Azure Files
module "azurefile" {
  source = "./modules/azurefile"

  location = var.location
  rg_name  = azurerm_resource_group.this.name
}

