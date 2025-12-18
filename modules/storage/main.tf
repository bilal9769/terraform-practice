resource "azurerm_storage_account" "this" {
  name                     = "st${lower(replace(var.resource_group_name, "-", ""))}"
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  network_rules {
    default_action             = "Deny"
    virtual_network_subnet_ids = [var.subnet_id]
  }
}