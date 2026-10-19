variable "project_name" {
  description = "name of the resource group"
  type        = string
  default     = "anozie"
}
variable "location" {
  description = "location of the resource group"
  type        = string
  default     = "Sweden Central"
}
#variable "acr_name" {
#  description = "name of the container registry"
#  type        = string
#  default     = "anoziecontainer313"
#}
variable "acr_sku" {
  description = "stock keeping unit of acr "
  type        = string
  default     = "Basic"
}
#variable "aks_name" {
#description = "name of kubernetes cluster"
#type        = string
# default     = "anozieakscluster313"
#}
variable "aks_vm_size" {
  description = "vm size of kubernetes cluster"
  type        = string
  default     = "Standard_D2as_v7"
}
variable "aks_dns_prefix" {
  description = "the dns prefix of the aks"
  type        = string
  default     = "aksanozie0203"
}
variable "tags" {
  description = "labels for the environment "
  type        = map(string)
  default = {
    environment = "Dev"
    owner       = "anozie"
  }
}
#variable "key_vault_name" {
# description = "the name of the key vault  "
# type        = string
# default     = "anoziekeyvault0313"
#}
variable "key_vault_sku_name" {
  description = "the sku name of key vault "
  type        = string
  default     = "standard"
}
variable "storage_account_name" {
  description = "the name of storage account"
  type        = string
  default     = "anoziesstorage3232"
}
#variable "storage_account_tier" {
#  description = "the account tier of the storage "
#  type        = string
#  default     = "standard"
#}
variable "storage_account_replication_type" {
  description = "the account replication type of the storage "
  type        = string
  default     = "LRS"
}
variable "storage_container_name" {
  description = "the name of the storage container"
  type        = string
  default     = "anoziescontainer"
}

