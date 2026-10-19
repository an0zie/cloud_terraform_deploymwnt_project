resource "azurerm_resource_group" "res_group" {
  name     = "${var.project_name}_rg"
  location = var.location
}
