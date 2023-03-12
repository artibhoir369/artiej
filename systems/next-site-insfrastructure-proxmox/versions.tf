terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
      version = "2.9.11"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}
provider "proxmox" {
  pm_api_url = var.PM_API_URL
  pm_api_token_id = var.PM_API_TOKEN_ID
  pm_api_token_secret = var.PM_API_TOKEN_SECRET
  pm_tls_insecure = true
}
provider "cloudflare" {
  api_token = var.CLOUDFLARE_API_TOKEN
}
provider "vault" {
  address = var.VAULT_ADDRESS
  token = var.VAULT_TOKEN
}
