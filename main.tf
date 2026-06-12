resource "oci_core_vcn" "main_vcn" {

  compartment_id = var.compartment_ocid

  cidr_blocks = [
    "10.0.0.0/16"
  ]

  display_name = "landing-zone-vcn"

  dns_label = "lzvcn"
}

resource "oci_core_subnet" "public_subnet" {

  compartment_id = var.compartment_ocid

  vcn_id = oci_core_vcn.main_vcn.id

  cidr_block = "10.0.1.0/24"

  display_name = "public-subnet"

  dns_label = "public"

  prohibit_public_ip_on_vnic = false
}