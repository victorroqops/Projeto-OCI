variable "default_av" {
  default = "TbRi:REGION-AD-1"
}

variable "default_compartment" {
  default = "ocid1.compartment.oc1..example_compartment_ocid"
}

variable "default_name" {
  description = "List of display names for each instance"
  default = [
    "INSTANCE_DISPLAY_NAME_1",
    "INSTANCE_DISPLAY_NAME_2",
    "INSTANCE_DISPLAY_NAME_3"
  ]
}

variable "default_shape" {
  description = "List of shapes for each instance"
  default     = ["VM.Standard.Example.Flex", "VM.Standard.Example.Flex", "VM.Standard.Example.Flex"]
}

variable "ocpu" {
  description = "List of number of CPUs for each instance"
  default     = [1, 2, 2]
}

variable "memory_in_gbs" {
  description = "List of memory sizes in GB for each instance"
  default     = [8, 8, 8]
}

variable "boot_volume_size_in_gbs" {
  description = "List of boot volume sizes in GB for each instance"
  default     = [100, 256, 256]
}

variable "default_image" {
  description = "List of OCIDs of the images for each instance"
  default = [
    "ocid1.image.oc1.region.example_image_ocid1",
    "ocid1.image.oc1.region.example_image_ocid2",
    "ocid1.image.oc1.region.example_image_ocid3"
  ]
}

variable "default_backup_policy" {
  default = "ocid1.volumebackuppolicy.oc1.region.example_backup_policy_ocid"
}

variable "default_vcn" {
  default = "ocid1.vcn.oc1.region.example_vcn_ocid"
}

variable "default_subnet" {
  default = "ocid1.subnet.oc1.region.example_subnet_ocid"
}

variable "default_private_ip_address" {
  description = "List of private IP addresses for each instance"
  default     = ["10.0.0.1", "10.0.0.2", "10.0.0.3"]
}

variable "default_nsg_name" {
  description = "List of network security group names for each instance"
  default = [
    "SG_INSTANCE_1",
    "SG_INSTANCE_2",
    "SG_INSTANCE_3"
  ]
}
