resource "random_string" "suffix" {
  length  = 5
  special = false
  upper   = false
}
locals {
  name_base = lower(replace(var.project_name, "/[^a-z0-9]/", ""))

  rg_name          = "${local.name_base}_rg"
  storage_acc_name = "${local.name_base}storage${random_string.suffix.result}"
  acr_name         = "${local.name_base}acr${random_string.suffix.result}"
  aks_name         = "${local.name_base}aks${random_string.suffix.result}"
  kv_name          = "${local.name_base}keyvault${random_string.suffix.result}"
}
