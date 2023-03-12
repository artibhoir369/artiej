data "cloudflare_zone" "zone" {
  name = "${var.NEXT_ZONE}"
}
resource "cloudflare_record" "vault" {
  zone_id   = data.cloudflare_zone.zone.id
  name = "${var.NEXT_VAULT_HOSTNAME}"
  value   = resource.linode_instance.web.ip_address
  type    = "A"
  ttl     = 1
  proxied = true
}

#variable
# variable "NEXT_MASTER_IP" {}

variable "NEXT_VAULT_HOSTNAME" {}

variable "NEXT_ZONE" {}
