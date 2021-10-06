locals {
        server_list  = jsonencode(compact([for ip in var.server_map: "${ip.server ? ip.ipaddress : ""}"]))
        server_count = length(compact([for ip in var.server_map: "${ip.server ? ip.ipaddress : ""}"]))
        ansible_list = [for ip in var.server_map: ip.ipaddress]
}