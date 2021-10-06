
resource "vsphere_virtual_machine" "hashistack" {
  for_each         = var.server_map
  name             = each.value.hostname
  resource_pool_id = data.vsphere_host.host.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 4
  memory   = 8096
  guest_id = data.vsphere_virtual_machine.template.guest_id
  firmware = "efi"

  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  disk {
    label            = "${each.value.hostname}-disk"
    size             = 40
    thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  }

  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
  }

  extra_config = {
    "guestinfo.metadata" = base64gzip(templatefile("./cloud-config/meta_template.yml", {
      hostname  = each.value.hostname
      ipaddress = each.value.ipaddress
    }))
    "guestinfo.metadata.encoding" = "gzip+base64"

    "guestinfo.userdata" = base64gzip(templatefile("./cloud-config/user_template.yml", {
      hostname    = each.value.hostname
      ipaddress   = each.value.ipaddress
      server      = each.value.server
      serverlist  = local.server_list
      servercount = local.server_count
      username    = var.vm_username
      datacenter  = var.nomad_datacenter
      token       = var.consul_token
      auth        = var.docker_auth
      ssh_team    = var.smallstep_team
      ssh_token   = var.smallstep_token
      ssh_tag     = var.smallstep_tag
    }))
    "guestinfo.userdata.encoding" = "gzip+base64"
  }
}

resource "local_file" "ansible-inventory" {

  content = <<-EOT
        [stack-servers]
        %{for ip in local.ansible_list}${ip}
        %{endfor}
        EOT

  filename = "${path.module}/template/inventory"
}