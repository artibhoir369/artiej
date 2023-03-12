resource "proxmox_vm_qemu" "virtual-utils" {
  count = 1
  name = var.INSTANCE_NAME
  target_node = var.PROXMOX_HOST
  clone = var.TEMPLATE_NAME
  agent = 1
  os_type = var.OS_TYPE
  cores = 2
  sockets = 1
  cpu = "host"
  memory = var.MEMORY
  scsihw = "virtio-scsi-pci"
  bootdisk = "scsi0"
  disk {
    slot = 0
    size = "30G"
    type = "scsi"
    storage = "local-lvm"
    iothread = 0
  }

  network {
    model = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  ipconfig0 = "ip=${var.IP}/${var.IP_SUBNET},gw=${var.GATEWAY}"
  ciuser = var.SSH_USER
  # sshkeys set using variables. the variable contains the text of the key.
  sshkeys = <<EOF
  ${var.SSH_KEY}
  EOF

  connection {
    type        = "ssh"
    user        = var.SSH_USER
    timeout     = "2m"
    host        = var.NEXT_MASTER_IP
    port        = "1022"
    private_key = file("${path.module}/jenkins")
  }
data "vault_generic_secret" "GIT_URL"{
    path = "kv/GIT_URL"
}
data "vault_generic_secret" "DOCKER_TOKEN"{
    path = "kv/DOCKER_TOKEN"
}

  provisioner "remote-exec" {
   inline = [
      "sudo apt update",
      "sudo apt install docker.io -y",
      "sudo snap install docker",
      "git clone ${data.vault_generic_secret.GIT_URL.data["GIT_URL"]}",
      "docker login -u artibhoir369 -p ${data.vault_generic_secret.DOCKER_TOKEN.data["DOCKER_TOKEN"]}",
      "docker pull artibhoir369/nextresearch:latest",
      "docker rm -f nextresearch",
      "docker run --name nextresearch -p 80:80 -v /root/ejs/app/www/ver4:/usr/share/nginx/html -v /root/ejs/app/confluence-report/download:/usr/share/nginx/html/docs -d artibhoir369/nextresearch",
    ]
  }
}
