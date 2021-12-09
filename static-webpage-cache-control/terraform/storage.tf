resource "azurerm_storage_account" "st" {
  name                     = "pnst${var.environment}"
  resource_group_name      = azurerm_resource_group.swcctest.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = "index.html"
  }
}

resource "azurerm_storage_blob" "sthtml" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.st.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/html"
  source                 = "../webfiles/index.html"
  cache_control          = "no-cache"
}

resource "azurerm_storage_blob" "stjs" {
  name                   = "hello_world.js"
  storage_account_name   = azurerm_storage_account.st.name
  storage_container_name = "$web"
  type                   = "Block"
  content_type           = "text/javascript"
  source                 = "../webfiles/hello_world.js"
}