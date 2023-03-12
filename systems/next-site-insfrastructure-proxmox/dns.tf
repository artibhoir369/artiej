data "cloudflare_zone" "zone" {
#  name = "${var.NEXT_ZONE}"
  name = "nextresearch.io"
}
resource "cloudflare_record" "vault" {
  zone_id   = data.cloudflare_zone.zone.id
#  name = "${var.NEXT_VAULT_HOSTNAME}"
  name = "proxmoxnextresearch"
#  value   = "${var.NEXT_MASTER_IP}"
  value   = "73.10.220.124"
  type    = "A"
  ttl     = 1
  proxied = true
}
