resource "oci_core_network_security_group" "nsg_instancia" {
  count = 3

  compartment_id = var.default_compartment
  vcn_id         = var.default_vcn
  display_name   = var.default_nsg_name[count.index]
}

resource "oci_core_network_security_group_security_rule" "nsg_instancia_rules" {
  count = 3

  destination               = "0.0.0.0/0"
  destination_type          = "CIDR_BLOCK"
  description               = "Saida para Internet"
  network_security_group_id = oci_core_network_security_group.nsg_instancia[count.index].id
  direction                 = "EGRESS"
  protocol                  = "all"
}

resource "oci_core_network_security_group_security_rule" "nsg_instancia_rules_acesso_cliente" {
  count = 3

  source                    = "10.107.195.0/25"
  source_type               = "CIDR_BLOCK"
  description               = "Subnet OCI"
  network_security_group_id = oci_core_network_security_group.nsg_instancia[count.index].id
  direction                 = "INGRESS"
  protocol                  = "all"
}
