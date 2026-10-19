resource "azurerm_role_assignment" "aks_s" {
  principal_id                     = azurerm_kubernetes_cluster.aks_anozie.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr_anozie.id
  skip_service_principal_aad_check = true
}
resource "azurerm_role_assignment" "keyvault_secrets" {
  principal_id         = data.azurerm_client_config.current.object_id
  role_definition_name = "Key Vault Secrets Officer"
  scope                = azurerm_key_vault.anoziekeyvault.id
}

