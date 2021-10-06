## vSphere Data
data vsphere_datacenter "dc" {
    name = var.datacenter_name
}

data vsphere_host "host" {
    name          = var.host_name
    datacenter_id = data.vsphere_datacenter.dc.id
}

data vsphere_datastore "datastore" {
    name          = var.datastore_name
    datacenter_id = data.vsphere_datacenter.dc.id
}

data vsphere_network "network" {
    name          = var.vm_network_name
    datacenter_id = data.vsphere_datacenter.dc.id
}

data vsphere_virtual_machine "template" {
    name          = var.template_name
    datacenter_id = data.vsphere_datacenter.dc.id
}