# VMWARE PROVIDER VARIABLES

vsphere_server   = "10.0.0.1"
vsphere_user     = "administrator@vsphere.local"
vsphere_password = "MySecurePassword123"


# VMWARE DATA SOURCE VARIABLES

datacenter_name = "DC"
host_name       = "10.0.1.1"
datastore_name  = "DS01"
vm_network_name = "VM Network"
template_name   = "linux-ubuntu-server-20.04.3-lts-hashicorp"


# CLOUD INIT VARIABLES

server_map = {

  "hashistack-s01" = {
    hostname  = "server-s01"
    ipaddress = "10.2.2.1"
    server    = true
  }

  "hashistack-s02" = {
    hostname  = "server-s02"
    ipaddress = "10.2.2.2"
    server    = true
  }

  "hashistack-s03" = {
    hostname  = "server-s03"
    ipaddress = "10.2.2.3"
    server    = true
  }
}

nomad_datacenter = "dc"
vm_username      = "stack_user"
consul_token     = "secure_token"
docker_auth      = "docker_user:pw"
smallstep_team   = "myteam"
smallstep_token  = "longtoken"
smallstep_tag    = "tag=server"