provider "vsphere" {
  user           = "${var.vsphere_user}"
  password       = "${var.vsphere_password}"
  vsphere_server = "${var.vsphere_server}"
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = "${var.vsphere_datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vsphere_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_resource_pool" "pool" {
  name          = "${var.vsphere_resource_pool}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vsphere_network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_virtual_machine" "vm_clone" {
  name          = "${var.vsphere_virtual_machine_name_vm_clone}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "cloned_virtual_machines" {
  name             = "${var.vsphere_virtual_machine_name_clone_vm}"
  resource_pool_id = "${data.vsphere_resource_pool.pool.id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = "${var.guest_vcpu}"
  memory   = "${var.guest_memory}"
  guest_id = "${data.vsphere_virtual_machine.vm_clone.guest_id}"

  scsi_type = "${data.vsphere_virtual_machine.vm_clone.scsi_type}"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    adapter_type = "${data.vsphere_virtual_machine.vm_clone.network_interface_types[0]}"
  }

  disk {
    label = "disk0"
    size = "${data.vsphere_virtual_machine.vm_clone.disks.0.size}"
    eagerly_scrub    = "${data.vsphere_virtual_machine.vm_clone.disks.0.eagerly_scrub}"
    thin_provisioned = "${data.vsphere_virtual_machine.vm_clone.disks.0.thin_provisioned}"
  }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.vm_clone.id}"

    customize {

      linux_options {
        host_name = "${var.guest_host_name}"
        domain    = "${var.guest_domain}"
      }

      network_interface {
        ipv4_address = "${var.guest_ipv4_address}"
        ipv4_netmask = "${var.guest_ipv4_netmask}"
      }

      ipv4_gateway    = "${var.guest_ipv4_gateway}"
      dns_server_list = ["${var.guest_dns_servers}"]
    }
  }
}