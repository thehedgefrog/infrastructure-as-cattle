### vSphere connection data ###

variable "vcenter_username" {
  type        = string
  description = "The username for authenticating to vCenter."
  sensitive   = true
}

variable "vcenter_password" {
  type        = string
  description = "The plaintext password for authenticating to vCenter."
  sensitive   = true
}

variable "vcenter_server" {
  type        = string
  description = "The fully qualified domain name or IP address of the vCenter Server instance."
}

variable "vcenter_insecure_connection" {
  type        = bool
  description = "If true, does not validate the vCenter server's TLS certificate."
  default     = true
}


### vSphere VM data ###

variable "vcenter_datacenter" {
  type        = string
  description = "Required if there is more than one datacenter in vCenter."
}

variable "vcenter_host" {
  type        = string
  description = "The ESXi host where target VM is created."
}

variable "vcenter_datastore" {
  type        = string
  description = "Required for clusters, or if the target host has multiple datastores."
}

variable "vcenter_network" {
  type        = string
  description = "The network segment or port group name to which the primary virtual network adapter will be connected."
}

variable "vcenter_folder" {
  type        = string
  description = "The VM folder in which the VM template will be created."
}


### SSH Connection Data ###

variable "ssh_username" {
  type        = string
  description = "The username to use to authenticate over SSH."
}

variable "ssh_password" {
  type        = string
  description = "The plaintext password to use to authenticate over SSH."
  sensitive   = true
}


# HTTP Endpoint

variable "http_directory" {
  type        = string
  description = "Directory of config files(user-data, meta-data)."
}


# Virtual Machine Settings

variable "vm_version" {
  type        = number
  description = "The VM virtual hardware version."
  # https://kb.vmware.com/s/article/1003746
}

variable "vm_cdrom_type" {
  type        = string
  description = "The virtual machine CD-ROM type."
}

variable "vm_disk_controller_type" {
  type        = list(string)
  description = "The virtual disk controller types in sequence."
}

variable "vm_network_card" {
  type        = string
  description = "The virtual network card type."
}