output vm_hostname {
    value       = [for vm in vsphere_virtual_machine.hashistack: vm.name]
    description = "The hostname of the VM"
}

output vm_private_ip {
    value       = [for vm in vsphere_virtual_machine.hashistack: vm.default_ip_address]
    description = "The IP of the VM"
}

output ansible_file {
    value       = "Ansible inventory file created at ${local_file.ansible-inventory.filename}"
}