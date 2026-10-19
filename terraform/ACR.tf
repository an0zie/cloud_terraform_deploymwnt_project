resource "azurerm_container_registry" "acr_anozie" {
  name                = "${var.project_name}acr313"
  location            = azurerm_resource_group.res_group.location
  resource_group_name = azurerm_resource_group.res_group.name
  sku                 = var.acr_sku
  admin_enabled       = false
  tags                = var.tags

}

#output "login_server" {
#  value = azurerm_container_registry.acr.login_server
#}
