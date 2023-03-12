data "cloudflare_zone" "zone" {
  name = var.NEXT_ZONE
}
resource "cloudflare_record" "vault" {
  zone_id   = data.cloudflare_zone.zone.id
  name = var.NEXT_VAULT_HOSTNAME
  value   = var.NEXT_MASTER_IP
  type    = "A"
  ttl     = 1
  proxied = true
}
