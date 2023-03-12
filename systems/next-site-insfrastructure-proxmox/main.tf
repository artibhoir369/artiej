resource "proxmox_vm_qemu" "virtual-utils" {
  count = 1
  name = var.instance_name
  target_node = var.proxmox_host
  clone = var.template_name
  agent = 1
  os_type = var.OS_TYPE
  cores = 2
  sockets = 1
  cpu = "host"
  memory = var.memory
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

  ipconfig0 = "ip=${var.ip}/${var.ip_subnet},gw=${var.gateway}"
  ciuser = var.ssh_user
  # sshkeys set using variables. the variable contains the text of the key.
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF

  connection {
    type        = "ssh"
    user        = var.ssh_user
    timeout     = "2m"
    host        = var.NEXT_MASTER_IP
    port        = "1022"
    private_key = file("${path.module}/jenkins")
  }
  provisioner "remote-exec" {
   inline = [
      "sudo apt update",
      "sudo apt install docker.io -y",
      "sudo snap install docker",
      "git clone ${var.GIT_URL}",
      "docker login -u artibhoir369 -p ${var.DOCKER_TOKEN}",
      "docker pull artibhoir369/nextresearch:latest",
      "docker rm -f nextresearch",
      "docker run --name nextresearch -p 80:80 -v /root/ejs/app/www/ver4:/usr/share/nginx/html -v /root/ejs/app/confluence-report/download:/usr/share/nginx/html/docs -d artibhoir369/nextresearch",
    ]
  }
}
