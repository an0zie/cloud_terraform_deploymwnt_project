resource "azurerm_kubernetes_cluster" "aks_anozie" {
  name                = "${var.project_name}akscluster313"
  location            = azurerm_resource_group.res_group.location
  resource_group_name = azurerm_resource_group.res_group.name
  dns_prefix          = var.aks_dns_prefix


  node_provisioning_profile {
    mode = "Manual"
  }


  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = var.aks_vm_size
    zones      = ["1", "2"]
  }
  identity {
    type = "SystemAssigned"
  }
  tags = var.tags



}

