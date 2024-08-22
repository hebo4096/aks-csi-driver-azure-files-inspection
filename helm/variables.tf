variable "azure_resource_group_name_for_helm" {
  type        = string
  description = "set the value of 'azure_resource_group_name_for_helm'"
}

variable "azure_storage_account_name_for_helm" {
  type        = string
  description = "set the value of 'azure_storage_account_name_for_helm'"
}

variable "azure_storage_account_key_for_helm" {
  type        = string
  description = "set the value of 'azure_storage_account_key_for_helm'"
}

variable "azurefile_share_name_for_helm" {
  type        = string
  description = "set the value of 'azure_storage_account_key_for_helm'"
}

variable "kube_config" {
  type        = string
  default     = "~/.kube/config"
  description = "location of kubeconfig file. If you have custom location, change the default value"
}
