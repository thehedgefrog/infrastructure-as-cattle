########## LINUX ##########

### Ubuntu Server 20.04.3 LTS ###
source "vsphere-iso" "ubuntu-20043lts" {

  vcenter_server       = var.vcenter_server
  username             = var.vcenter_username
  password             = var.vcenter_password
  datacenter           = var.vcenter_datacenter
  datastore            = var.vcenter_datastore
  host                 = var.vcenter_host
  folder               = var.vcenter_folder
  insecure_connection  = var.vcenter_insecure_connection
  tools_upgrade_policy = true
  remove_cdrom         = true
  convert_to_template  = true
  guest_os_type        = "ubuntu64Guest"
  vm_version           = var.vm_version

  notes                = "Built by HashiCorp Packer on ${local.buildtime}."
  vm_name              = "linux-ubuntu-server-20.04.3-lts-hashicorp"
  firmware             = "efi"
  CPUs                 = 2
  cpu_cores            = 4
  CPU_hot_plug         = false
  RAM                  = 8192
  RAM_hot_plug         = false
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = var.vm_disk_controller_type

  storage {
    disk_size             = 40960
    disk_controller_index = 0
    disk_thin_provisioned = true
  }

  network_adapters {
    network      = var.vcenter_network
    network_card = var.vm_network_card
  }

  iso_url        = "https://releases.ubuntu.com/20.04/ubuntu-20.04.3-live-server-amd64.iso"
  iso_checksum   = "sha256:f8e3086f3cea0fb3fefb29937ab5ed9d19e767079633960ccb50e76153effc98"
  http_directory = "${var.http_directory}/ubuntu"
  boot_order     = "disk,cdrom"
  boot_wait      = "3s"

  boot_command = [
    "<esc><esc><esc>",
    "set gfxpayload=keep<enter>",
    "linux /casper/vmlinuz ",
    "\"ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/\" ",
    "quiet autoinstall ---<enter>",
    "initrd /casper/initrd<enter>",
    "boot<enter>"
  ]

  ip_wait_timeout        = "20m"
  ssh_password           = var.ssh_password
  ssh_username           = var.ssh_username
  ssh_port               = 22
  ssh_timeout            = "30m"
  ssh_handshake_attempts = "100000"
  shutdown_command       = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout       = "15m"
}


### Red Hat Enterprise Linux 8.4 ###
source "vsphere-iso" "rhel8" {

  vcenter_server       = var.vcenter_server
  username             = var.vcenter_username
  password             = var.vcenter_password
  datacenter           = var.vcenter_datacenter
  datastore            = var.vcenter_datastore
  host                 = var.vcenter_host
  folder               = var.vcenter_folder
  insecure_connection  = var.vcenter_insecure_connection
  tools_upgrade_policy = true
  remove_cdrom         = true
  convert_to_template  = true
  guest_os_type        = "rhel8_64Guest"
  vm_version           = var.vm_version

  notes                = "Built by HashiCorp Packer on ${local.buildtime}."
  vm_name              = "linux-rhel-8.4"
  firmware             = "efi"
  CPUs                 = 2
  cpu_cores            = 4
  CPU_hot_plug         = false
  RAM                  = 8192
  RAM_hot_plug         = false
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = var.vm_disk_controller_type

  storage {
    disk_size             = 40960
    disk_controller_index = 0
    disk_thin_provisioned = true
  }

  network_adapters {
    network      = var.vcenter_network
    network_card = var.vm_network_card
  }

  iso_url        = "https://developers.redhat.com/content-gateway/file/rhel-8.4-x86_64-boot.iso"
  iso_checksum   = "sha256:5fa79f357dab40056e1052cb4b03ff9fe7a502b519df7e3789f8899b3f461945"
  http_directory = "${var.http_directory}/rhel"
  boot_order     = "disk,cdrom"
  boot_wait      = "3s"

  boot_command = [
    "e<down><down><end>",
    "<bs><bs><bs><bs><bs>text ",
    "ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
    "<leftCtrlOn>x<leftCtrlOff>"
  ]

  ip_wait_timeout        = "20m"
  ssh_password           = var.ssh_password
  ssh_username           = var.ssh_username
  ssh_port               = 22
  ssh_timeout            = "30m"
  ssh_handshake_attempts = "100000"
  shutdown_command       = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout       = "15m"
}


### Rocky Linux 8.4 ###
source "vsphere-iso" "rocky8" {

  vcenter_server       = var.vcenter_server
  username             = var.vcenter_username
  password             = var.vcenter_password
  datacenter           = var.vcenter_datacenter
  datastore            = var.vcenter_datastore
  host                 = var.vcenter_host
  folder               = var.vcenter_folder
  insecure_connection  = var.vcenter_insecure_connection
  tools_upgrade_policy = true
  remove_cdrom         = true
  convert_to_template  = true
  guest_os_type        = "centos8_64Guest"
  vm_version           = var.vm_version

  notes                = "Built by HashiCorp Packer on ${local.buildtime}."
  vm_name              = "linux-rocky-8.4"
  firmware             = "efi"
  CPUs                 = 2
  cpu_cores            = 4
  CPU_hot_plug         = false
  RAM                  = 8192
  RAM_hot_plug         = false
  cdrom_type           = var.vm_cdrom_type
  disk_controller_type = var.vm_disk_controller_type

  storage {
    disk_size             = 40960
    disk_controller_index = 0
    disk_thin_provisioned = true
  }

  network_adapters {
    network      = var.vcenter_network
    network_card = var.vm_network_card
  }

  iso_url        = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-8.4-x86_64-boot.iso"
  iso_checksum   = "sha256:53a62a72881b931bdad6b13bcece7c3a2d4ca9c4a2f1e1a8029d081dd25ea61f"
  http_directory = "${var.http_directory}/rocky"
  boot_order     = "disk,cdrom"
  boot_wait      = "3s"

  boot_command = [
    "e<down><down><end>",
    "<bs><bs><bs><bs><bs>text ",
    "ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg",
    "<leftCtrlOn>x<leftCtrlOff>"
  ]

  ip_wait_timeout        = "20m"
  ssh_password           = var.ssh_password
  ssh_username           = var.ssh_username
  ssh_port               = 22
  ssh_timeout            = "30m"
  ssh_handshake_attempts = "100000"
  shutdown_command       = "echo '${var.ssh_password}' | sudo -S -E shutdown -P now"
  shutdown_timeout       = "15m"
}