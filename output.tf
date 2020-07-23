output "ip" {
   value = "${vsphere_virtual_machine.cloned_virtual_machine.*.default_ip_address}"
}
output "vm-moref" {
   value = "${vsphere_virtual_machine.cloned_virtual_machine.moid}"
}