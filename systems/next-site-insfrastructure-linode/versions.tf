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

provider "linode" {
  token = var.token
  api_version = "v4beta"
}
provider "cloudflare" {
  api_token = var.CLOUDFLARE_API_TOKEN
}


# variables
variable "token" {}

variable "CLOUDFLARE_API_TOKEN" {}

