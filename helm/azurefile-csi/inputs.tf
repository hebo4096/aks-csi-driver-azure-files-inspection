variable "azure_resource_group_name" {
  type = string
  description = "resource group  of where azure storage account exists"
}

variable "azure_storage_account_name" {
  type = string
  description = "name of Azure Storage Account" 
}

variable "azure_storage_account_key" {
  type = string
  description = "name of Azure Storage Account" 
}

variable "azurefile_share_name" {
  type = string
  description = "name of Azure Files Share"
}
