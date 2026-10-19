data "azurerm_client_config" "current" {}
resource "azurerm_key_vault" "anoziekeyvault" {
  name                        = local.kv_name
  location                    = azurerm_resource_group.res_group.location
  resource_group_name         = azurerm_resource_group.res_group.name
  sku_name                    = var.key_vault_sku_name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  purge_protection_enabled    = true
  soft_delete_retention_days  = 7
  enabled_for_disk_encryption = true
  rbac_authorization_enabled  = true

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
  }
}
