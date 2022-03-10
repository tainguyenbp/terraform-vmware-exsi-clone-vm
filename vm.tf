module "example-server-windowsvm-advanced" {
   source                 = "Terraform-VMWare-Modules/vm/vsphere"
  version                = "Latest X.X.X"
  dc                     = "Datacenter"
  vmrp                   = "cluster/Resources"
  vmfolder               = "Cattle"
  ds_cluster             = "Datastore Cluster"
  vmtemp                 = "TemplateName"
  instances              = 2
  cpu_number             = 2
  ram_size               = 2096
  cpu_hot_add_enabled    = true
  cpu_hot_remove_enabled = true
  memory_hot_add_enabled = true
  vmname                 = "AdvancedVM"
  vmdomain               = "somedomain.com"
  network_cards          = ["VM Network", "test-netwrok"]
  ipv4submask            = ["24", "8"]
  ipv4 = {
    "VM Network" = ["192.168.0.4", ""] // Here the first instance will use Static Ip and Second DHCP
    "test"       = ["", "192.168.0.3"]
  }
  data_disk_size_gb = [10, 5] // Aditional Disks to be used
  disk_label                 = ["tpl-disk-1"]
  data_disk_label            = ["label1", "label2"]
  scsi_type = "lsilogic" # "pvscsi"
  scsi_controller = 0 # template disk scsi_controller
  data_disk_scsi_controller  = [0, 1]
  disk_datastore             = "vsanDatastore"
  data_disk_datastore        = ["vsanDatastore", "nfsDatastore"]
  thin_provisioned  = [true, false]
  vmdns             = ["192.168.0.2", "192.168.0.1"]
  vmgateway         = "192.168.0.1"
  network_type = ["vmxnet3", "vmxnet3"]
  tags = {
    "terraform-test-category"    = "terraform-test-tag"
    "terraform-test-category-02" = "terraform-test-tag-02"
  }
  enable_disk_uuid = true
  auto_logon       = true
  run_once         = ["mkdir c:\\admin", "echo runonce-test >> c:\\admin\\logs.txt", "powershell.exe \"New-Item&nbsp;C:\\test.txt\""]
  orgname          = "Terraform-Module"
  workgroup        = "Module-Test"
  is_windows_image = true
  firmware         = "efi"
  local_adminpass  = "Password@Strong"
}
