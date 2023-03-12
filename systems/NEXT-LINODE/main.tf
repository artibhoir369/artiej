resource "linode_instance" "web" {
    label = var.instance_name
    image = var.image
    region = var.region
    type = var.instance_type
    authorized_keys = [var.ssh_key]
    root_pass = data.vault_generic_secret.ROOT_PASS.data["ROOT_PASS"]

    provisioner "file" {
      source = "setup_script.sh"
      destination = "/tmp/setup_script.sh"
      connection {
        type = "ssh"
        host = self.ip_address
        user = "root"
        password = data.vault_generic_secret.ROOT_PASS.data["ROOT_PASS"]
      }
    }
    provisioner "remote-exec" {
      inline = [
        "chmod +x /tmp/setup_script.sh",
        "/tmp/setup_script.sh",
        "sleep 10"
      ]
      connection {
        type = "ssh"
        host = self.ip_address
        user = "root"
        password = data.vault_generic_secret.ROOT_PASS.data["ROOT_PASS"]
      }
    }
}

data "vault_generic_secret" "VAULT_TOKEN"{
    path = "kv/ROOT_PASS"
}

resource "linode_firewall" "my_firewall" {
  label = "my_firewall"

  inbound {
    label    = "allow-http"
    action   = "ACCEPT"
    protocol = "TCP"
    ports    = "80"
    ipv4     = ["0.0.0.0/0"]
    ipv6     = ["::/0"]
  }

  inbound_policy = "DROP"

  outbound_policy = "ACCEPT"

  linodes = [linode_instance.web.id]
}

# variables
variable "ssh_key" {}
variable "instance_type" {}
variable "region" {}
variable "image" {}
variable "user" {}
variable "instance_name" {}
