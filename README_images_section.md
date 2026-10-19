## Screenshots

Everything below was created by `terraform apply` in Azure (Sweden Central), then removed with `terraform destroy`.

### Resource group with all four resources
![Resource group](images/02-anozie-rg-resources.png)

### Container Registry (ACR)
![ACR](images/03-acr.png)

### Kubernetes cluster (AKS)
![AKS](images/04-aks.png)

### Key Vault
![Key Vault](images/05-key-vault.png)

### Storage account and blob container
![Storage account](images/06-storage-account.png)
![Blob containers](images/07-blob-containers.png)

### Remote state stored as a blob
![Terraform state blob](images/08-terraform-state-blob.png)

### Resource group AKS created for itself
![AKS managed resource group](images/09-aks-managed-resource-group.png)
