resource "azurerm_resource_group" "swcctest" {
  name     = "pn-rg-${var.environment}"
  location = var.location
}