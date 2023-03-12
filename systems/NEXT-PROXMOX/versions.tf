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
data "vault_generic_secret" "PM_API_TOKEN_ID"{
    path = "kv/PM_API_TOKEN_ID"
}
data "vault_generic_secret" "PM_API_TOKEN_SECRET"{
    path = "kv/PM_API_TOKEN_SECRET"
}
data "vault_generic_secret" "CLOUDFLARE_API_TOKEN"{
    path = "kv/CLOUDFLARE_API_TOKEN"
}
data "vault_generic_secret" "VAULT_ADDRESS"{
    path = "kv/VAULT_ADDRESS"
}
data "vault_generic_secret" "VAULT_TOKEN"{
    path = "kv/VAULT_TOKEN"
}

provider "proxmox" {
  pm_api_url = var.PM_API_URL
  pm_api_token_id = data.vault_generic_secret.PM_API_TOKEN_ID.data["PM_API_TOKEN_ID"]
  pm_api_token_secret = data.vault_generic_secret.PM_API_TOKEN_SECRET.data["PM_API_TOKEN_SECRET"]
  pm_tls_insecure = true
}
provider "cloudflare" {
  api_token = data.vault_generic_secret.CLOUDFLARE_API_TOKEN.data["CLOUDFLARE_API_TOKEN"]
}
provider "vault" {
  address = data.vault_generic_secret.VAULT_ADDRESS.data["VAULT_ADDRESS"]
  skip_tls_verify = true
  token = data.vault_generic_secret.VAULT_TOKEN.data["VAULT_TOKEN"]
}
