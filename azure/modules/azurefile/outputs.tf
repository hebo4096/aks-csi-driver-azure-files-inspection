output "azure_storage_account_name" {
  value = azurerm_storage_account.this.name
}

output "azure_storage_account_key" {
  value     = azurerm_storage_account.this.primary_access_key
}

output "azurefile_share_name" {
  value = azurerm_storage_share.this.name
}
