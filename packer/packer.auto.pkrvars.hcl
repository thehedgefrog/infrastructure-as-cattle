### vSphere connection data ###
vcenter_username            = "administrator@vsphere.local"
vcenter_password            = "MySecurePassword123"
vcenter_server              = "10.0.0.1"
vcenter_insecure_connection = true

### vSphere VM data ###
vcenter_datacenter = "DC"
vcenter_host       = "10.0.1.1"
vcenter_datastore  = "DS01"
vcenter_network    = "VM Network"
vcenter_folder     = "Packer Templates"

### SSH Connection Data ###
ssh_username = "packer"
ssh_password = "packer"

# HTTP Endpoint
http_directory = "http"

# Virtual Machine Settings
  # https://kb.vmware.com/s/article/1003746
vm_version              = 19
vm_cdrom_type           = "sata"
vm_disk_controller_type = ["pvscsi"]
vm_network_card         = "vmxnet3"