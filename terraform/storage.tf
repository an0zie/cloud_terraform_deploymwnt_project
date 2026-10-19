resource "azurerm_storage_account" "anozie_storage" {
  name                     = "${var.project_name}sstorage3232"
  location                 = azurerm_resource_group.res_group.location
  resource_group_name      = azurerm_resource_group.res_group.name
  account_tier             = "Standard"
  account_replication_type = var.storage_account_replication_type

  tags = var.tags
}
resource "azurerm_storage_container" "anozie_container" {
  name = var.storage_container_name
  #resource_group_name   = azurerm_resource_group.res_group.name
  #storage_account_name  = var.storage_account_name
  storage_account_id    = azurerm_storage_account.anozie_storage.id
  container_access_type = "private"
}
