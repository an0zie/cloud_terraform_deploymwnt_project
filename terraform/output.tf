output "resource_group_name" {
  value = azurerm_resource_group.res_group.name
}
output "acr_login_server" {
  value = azurerm_container_registry.acr_anozie.login_server
}
output "kubernetes_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_anozie.name
}
output "key_vault_name" {
  value = azurerm_key_vault.anoziekeyvault.name
}
output "storage_account_name" {
  value = azurerm_storage_account.anozie_storage.name
}

output "acr_name" {
  value = azurerm_container_registry.acr_anozie.name
}
