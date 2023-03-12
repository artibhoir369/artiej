terraform {
  required_providers {
    linode = {
      source = "linode/linode"
      version = "1.29.4"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}
data "vault_generic_secret" "LINODE_TOKEN"{
    path = "kv/LINODE_TOKEN"
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

provider "linode" {
  token = data.vault_generic_secret.LINODE_TOKEN.data["LINODE_TOKEN"]
  api_version = "v4beta"
}
provider "cloudflare" {
  api_token = data.vault_generic_secret.CLOUDFLARE_API_TOKEN.data["CLOUDFLARE_API_TOKEN"]
}

provider "vault" {
  address = data.vault_generic_secret.VAULT_ADDRESS.data["VAULT_ADDRESS"]
  skip_tls_verify = true
  token = data.vault_generic_secret.VAULT_TOKEN.data["VAULT_TOKEN"]
}
