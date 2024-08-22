resource "random_id" "azurefile" {
  byte_length = 8
}

resource "azurerm_storage_account" "this" {
  name                = "csifiles${random_id.azurefile.hex}"
  location            = var.location
  resource_group_name = var.rg_name

  account_tier             = "Premium"
  account_replication_type = "LRS"
  account_kind             = "FileStorage"
}

resource "azurerm_storage_share" "this" {
  name                 = "share${random_id.azurefile.hex}"
  storage_account_name = azurerm_storage_account.this.name
  depends_on           = [azurerm_storage_account.this]


  quota = "110"
}
