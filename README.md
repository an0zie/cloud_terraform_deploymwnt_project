# Terraform on Azure: AKS, ACR, Key Vault and Storage

Infrastructure as Code project that deploys a small container platform on Microsoft Azure using Terraform. Built while learning DevOps, including the errors I hit along the way and how I fixed them.

## What it builds

- **Resource group** to hold everything
- **Azure Container Registry (ACR)** for private Docker images
- **Azure Kubernetes Service (AKS)** cluster with one node
- **Key Vault** for secrets, using RBAC
- **Storage account and blob container**
- **Role assignments** so AKS can pull images from ACR (`AcrPull`) and I can manage Key Vault secrets (`Key Vault Secrets Officer`), with no passwords stored anywhere

```
Resource group
├── ACR  <── AcrPull ──  AKS (managed identity)
├── Key Vault  <── Secrets Officer ──  deploying user
└── Storage account └── blob container
```

## Project structure

| File | Purpose |
|---|---|
| `provider.tf` | Azure and random provider setup, with pinned versions |
| `main.tf` | Resource group |
| `variables.tf` | Inputs: project name, location, SKUs, VM size, tags |
| `locals.tf` | Computed names, with a random suffix for globally unique names |
| `ACR.tf`, `AKS.tf`, `keyVault.tf`, `storage.tf` | The Azure resources |
| `rbac.tf` | Role assignments |
| `output.tf` | Values printed after apply (registry login server, cluster name) |
| `backend.tf` | Remote state in Azure Blob Storage (commented out, see notes) |

## Prerequisites

- Terraform
- Azure CLI, signed in with `az login`
- An Azure subscription with vCPU quota for the VM size you choose

## Usage

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

Defaults are set in `variables.tf` (region: Sweden Central, VM size: `Standard_D2as_v7`). VM sizes depend on your subscription's quota and region, so change them if `apply` reports a quota or SKU error.

## Clean up

```bash
terraform destroy
```

AKS bills while it runs. Always destroy when you finish.

## Problems I hit and how I fixed them

| Problem | Cause | Fix |
|---|---|---|
| `az` and `terraform` "command not found" | A terminal only reads PATH at startup | Restarted the IDE |
| Provider `hashicorp/azure` not found | Typo: `azure_` instead of `azurerm_` | The resource prefix decides the provider, so fixed the spelling |
| AKS errors on an old provider | `azurerm` 3.0.0 called retired API versions | Upgraded to 5.8.0 and renamed changed arguments |
| AKS VM size failures | Zero family quota, size too small, size blocked for my subscription, no regional capacity, a blocked zone | Read the allowed SKU list, checked `az vm list-usage` and `az vm list-skus`, pinned zones |
| Resources in Azure but missing from state | Apply was interrupted | `terraform import` |
| `destroy` failed to save state | The backend storage account was managed by the same config | Created the backend storage outside the config, see below |
| Red squiggles in the editor | Editor read old provider schemas | `terraform validate` was the check to trust |
| Git staged state files | `.gitignore` lines had a leading space | Rewrote the file with no leading spaces and checked with `git add --dry-run` |

## Notes

- **State files are not committed.** They can contain secrets in plain text, so `.gitignore` excludes them.
- **Remote state:** the backend storage account must be created separately from this config, or `terraform destroy` deletes the storage holding its own state.
- Key Vault has purge protection on, so a destroyed vault stays soft-deleted for 7 days.

## What I learned

- Read the plan summary every time, especially the destroy count
- Pin provider versions
- Check quota and SKU restrictions before blaming your code
- Never let a config manage the storage holding its own state
