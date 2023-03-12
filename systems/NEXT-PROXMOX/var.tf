variable "SSH_KEY" {
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDHcC9vn59ewofFX/xtbUZzvAnYQOcXqWnGueeawgmSieqzGCU+8DZvH0mA5jV25U00VkFUI1S935UBNG31XWTZmnBXeT3nOMkY4NKe/RI4PzRETFmuib7hhzdNmmSfDpiUkJFb0Zlg9ummdMpVLeu+SA2qQ8YDV0ybAn872ZL/4s+O8UgQvSlQbglE0TKJM3Z6VZb6rZhHFGCq1rx2WNNa6e7ohfMxU5KI+md9Hk5BnanSIZZf/XsZoZ0JGssZtAc48cyVC4f3IcPdhWHO/oxOJOy+QEPnn6iiQ4mal768bI3Pa8w5rimOBUybbBg5RzyIkk7MSUQfFXYLhTJ3FWqD4KSgmBNxJaivkidDjcV9MOah+7Fkl+9VuqdDrUzH02J0p8L2dnSuU6r6ALo1yRZxVsadPr7Q1NS6IA8sJOOqsVgwILcEMXg06Dcuj/gvbHeQjhg0J2DW+X84uYEA/dtiaMyc/Zh8GzoJU7i1NOr3H4b162uPy9G6bLz+7LzHYdM= ejbest@lenovo-win"
}
variable "PROXMOX_HOST" {
    default = "pve"
}
variable "TEMPLATE_NAME" {
    default = "ubuntu-cloud-template"
}
variable "OS_TYPE" {
    default = "cloud-init"
}
variable "CPU" {
    default = "2"
}
variable "MEMORY" {
    default = "2048"
}
variable "DISK_SIZE" {
    default = "30G"
}
variable "IP" {
    default = "192.168.0.60"
}
variable "IP_SUBNET" {
    default = "24"
}
variable "GATEWAY" {
    default = "192.168.0.1"
}
variable "SSH_USER" {
    default = "root"
}
variable "USER" {
    default = "root"
}
variable "INSTANCE_NAME" {
    default = "nextresearch"
}
variable "NEXT_MASTER_IP" {
    default = "73.10.220.124"
}
variable "NEXT_ZONE" {
    default = "nextresearch.io"
}
variable "NEXT_VAULT_HOSTNAME" {
    default = "proxmoxnextresearch"
}
variable "PM_API_URL" {
    default = "https://73.10.220.124:1006/api2/json"
}
# variable "PM_API_TOKEN_ID" {
#     default = "terraform@pve!automation"
# }
# variable "PM_API_TOKEN_SECRET" {
#     default = "940722fa-fc1c-4eff-b6d3-0a271047c7e4"
# }
# variable "GIT_URL" {
#     default = "https://artibhoir369:glpat-jiwXCPszrVcxqVeG2Jem@gitlab.com/advocatediablo/ejs.git"
# }
# variable "CLOUDFLARE_API_TOKEN" {
#     default = "niJpi2UhgQOERzVqXItay3nGBQoJoEjiCqVCEDJb"
# }
# variable "DOCKER_TOKEN" {
#     default = "dckr_pat_GN5LxgN6RoSOHDf67_qzrewkZ8g"
# }

# variable "VAULT_ADDRESS" {
#     default = "http://vault.auto-deploy.net:8200/"
# }

# variable "VAULT_TOKEN" {
#     default = "hvs.fnLvpZBujDaxx8SQORYNcFdV"
# }
