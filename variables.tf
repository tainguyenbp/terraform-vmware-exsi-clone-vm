# 
variable "vsphere_user" {
    description = "vsphere login account. defaults to admin account"
}

variable "vsphere_password" {
    description = "vsphere account password. empty by default."
}

variable "vsphere_server" {
    description = "vsphere server, defaults to localhost"
}

variable "vsphere_datacenter" {
    description = "vsphere datacenter the virtual machine will be deployed to. empty by default."
}

variable "vsphere_resource_pool" {
    description = "vsphere resource pool the virtual machine will be deployed to. empty by default."
}

variable "vsphere_datastore" {
    description = "vsphere datastore the virtual machine will be deployed to. empty by default."
}

variable "vsphere_network" {
    description = "vsphere network the virtual machine will be connected to. empty by default."
}

variable "vsphere_virtual_machine_name_vm_clone" {
    description = "vsphere virtual machine template that the virtual machine will be cloned from. empty by default."
}

variable "vsphere_virtual_machine_name_clone_vm" {
    description = "the name of the vsphere virtual machine that is created. empty by default."
}

variable "guest_vcpu" {
    description = "The number of virtual processors to assign to this virtual machine. Default: 1."
    default     = "1"
}

variable "guest_memory" {
  description = "The size of the virtual machine's memory, in MB. Default: 1024 (1 GB)."
  default     = "1024"
}

variable "guest_ipv4_netmask" {
  description = "The IPv4 subnet mask, in bits (example: 24 for 255.255.255.0)."
}

variable "guest_ipv4_gateway" {
  description = "The IPv4 default gateway."
}

variable "guest_ipv4_address" {
  description = "The ipv4 address for servers to configure on the virtual machine."
}

variable "guest_dns_servers" {
  description = "The list of DNS servers to configure on the virtual machine."
}

variable "guest_host_name" {
  description = "The host name for this machine."
}

variable "guest_domain" {
  description = "The domain name for this machine."
}