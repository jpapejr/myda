##############################################################################
# Image Data Sources
##############################################################################

data "ibm_is_image" "ibm_redhat_7_9_minimal_amd64_13" {
  name = "ibm-redhat-7-9-minimal-amd64-13"
}

##############################################################################

##############################################################################
# Vpc VPC VSI 1 Deployment
##############################################################################

resource "ibm_is_instance" "vpc_vpc_vsi1_vsi_1_1" {
  name           = "${var.prefix}-vpc-vsi1-vsi-zone-1-1"
  image          = data.ibm_is_image.ibm_redhat_7_9_minimal_amd64_13.id
  profile        = "bx2-2x8"
  resource_group = ibm_resource_group.rg.id
  vpc            = module.vpc_vpc.id
  zone           = "${var.region}-1"
  tags = [
    "stacks",
    "epx",
    "projects"
  ]
  primary_network_interface {
    subnet = module.vpc_vpc.tier1_zone_1_id
    security_groups = [
      module.vpc_vpc.sg1_id
    ]
  }
  boot_volume {
    encryption = ibm_kms_key.kms_key1_key.crn
  }
  keys = [
    data.ibm_is_ssh_key.slurm_key.id
  ]
  volumes = [
  ]
}

##############################################################################
