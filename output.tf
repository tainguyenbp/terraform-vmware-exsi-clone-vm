output "ip" {
   value = "${vsphere_virtual_machine.cloned_vm.*.default_ip_address}"
}
output "vm-moref" {
   value = "${vsphere_virtual_machine.cloned_vm.moid}"
}