# Provider Vcenter
vsphere_user = "administrator@vsphere.local"
vsphere_password = "password"
vsphere_server = "192.168.10.10"

# Infrastructure
vsphere_datacenter = "DC-TAINN"
vsphere_datastore = "disk5-server101"
vsphere_resource_pool = "192.168.10.101/Resources"
vsphere_network = "VLAN10"

# Infor VM clone
vsphere_virtual_machine_name_vm_clone = "k8s-master-1"
vsphere_virtual_machine_name_clone_vm = "k8s-master-2"

# Infor VM
guest_vcpu = "1"
guest_memory = "1024"
guest_ipv4_address = "192.168.10.13"
guest_ipv4_netmask = "24"
guest_ipv4_gateway = "192.168.10.1"
guest_dns_servers = "192.168.10.254"
guest_domain = "k8s-master-2"
guest_host_name = "k8s-master-2"