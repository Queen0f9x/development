resource "proxmox_vm_qemu" "circleci_node" {
  count                  = 1
  name                   = "circleci"
  target_node            = var.proxmox_host
  clone                  = var.template_name
  full_clone             = true
  agent                  = 1
  os_type                = "cloud-init"
  cores                  = 2
  sockets                = 1
  cpu                    = "host"
  memory                 = 2048
  scsihw                 = "virtio-scsi-single"
  bootdisk               = "scsi0"
  ipconfig0              = "ip=dhcp"
  automatic_reboot       = true

  vga {
    type = "serial0"
  }
  
  disk {
    slot     = 0
    size     = "8G"
    type     = "scsi"
    storage  = "local-lvm"
    iothread = 1
  }

  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
}
