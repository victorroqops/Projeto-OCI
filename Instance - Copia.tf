resource "oci_core_instance" "instancia_padrao" {
  count = 3

  compartment_id      = var.default_compartment
  availability_domain = var.default_av
  display_name        = var.default_name[count.index]
  shape               = var.default_shape[count.index]

  shape_config {
    ocpus         = var.ocpu[count.index]
    memory_in_gbs = var.memory_in_gbs[count.index]
  }
  source_details {
    boot_volume_size_in_gbs = var.boot_volume_size_in_gbs[count.index]
    boot_volume_vpus_per_gb = "10"
    source_id               = var.default_image[count.index]
    source_type             = "image"
  }
  create_vnic_details {
    display_name           = var.default_name[count.index]
    private_ip             = var.default_private_ip_address[count.index]
    assign_public_ip       = "false"
    skip_source_dest_check = "false"
    subnet_id              = var.default_subnet
    nsg_ids                = [oci_core_network_security_group.nsg_instancia[count.index].id]
  }
}

output "instance_private_ips" {
  value = [for i in oci_core_instance.instancia_padrao : i.private_ip]
}

resource "oci_core_volume_backup_policy_assignment" "Backup_padrao" {
  count     = 3
  asset_id  = oci_core_instance.instancia_padrao[count.index].boot_volume_id
  policy_id = var.default_backup_policy
}
