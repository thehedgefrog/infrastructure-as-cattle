# ---------------------------------------------------------------------------------------------------------------------
# VMWARE PROVIDER VARIABLES
# These are used to connect to vCenter.
# ---------------------------------------------------------------------------------------------------------------------

variable vsphere_server {
  type        = string
  description = "IP or FQDN of the vSphere server into which resources will be created."
}

variable vsphere_user {
  type        = string
  description = "Username of an admin of the vSphere server into which resources will be created."
}

variable vsphere_password {
  type        = string
  description = "Plaintext password of an admin of the vSphere server into which resources will be created."
}


# ---------------------------------------------------------------------------------------------------------------------
# VMWARE DATA SOURCE VARIABLES
# These are used to discover unmanaged resources used during deployment.
# ---------------------------------------------------------------------------------------------------------------------

variable datacenter_name {
  type        = string
  description = "The name of the vSphere Datacenter into which resources will be created."
}

variable host_name {
  type        = string
  description = "The vSphere host into which resources will be created."
}

variable datastore_name {
  type        = string
  description = "The vSphere Datastore into which resources will be created."
}

variable datastore_cluster_name {
  type    = string
  default = ""
}

variable vm_network_name {
  type = string
}

variable template_name {
  type = string
}


# ---------------------------------------------------------------------------------------------------------------------
# CLOUD INIT VARIABLES
# Variables used for generation of metadata and userdata.
# ---------------------------------------------------------------------------------------------------------------------

variable server_map {
  type        = map(object({
      hostname  = string
      ipaddress = string
      server    = bool
  }))
  description = "List of server hostnames and IPs for the cluster"
}

variable nomad_datacenter {
  type        = string
  description = "The name of the Nomad datacenter"
}

variable vm_username {
  type        = string
  description = "Username of the created user in the VM"
}

variable consul_token {
  type        = string
  description = "The Consul encryption token"
}

variable docker_auth {
  type        = string
  description = "The base64 user:password of Docker Hub"
}

variable smallstep_team {
  type        = string
  description = "Team name in Smallstep"
}

variable smallstep_token {
  type        = string
  description = "The Smallstep SSH enrollment token"
}

variable smallstep_tag {
  type        = string
  description = "The Smallstep host tag"
}

