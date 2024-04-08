##############################################################################
# Vpc VPC
##############################################################################

resource "ibm_is_vpc" "vpc_vpc" {
  name                        = "${var.prefix}-vpc-vpc"
  resource_group              = var.rg_id
  tags                        = var.tags
  no_sg_acl_rules             = true
  default_network_acl_name    = null
  default_security_group_name = null
  default_routing_table_name  = null
}

resource "ibm_is_vpc_address_prefix" "vpc_vpc_zone_1_prefix" {
  name = "${var.prefix}-vpc-vpc-zone-1"
  vpc  = ibm_is_vpc.vpc_vpc.id
  zone = "${var.region}-1"
  cidr = "10.10.0.0/22"
}

resource "ibm_is_public_gateway" "vpc_gateway_zone_1" {
  name           = "${var.prefix}-vpc-gateway-zone-1"
  vpc            = ibm_is_vpc.vpc_vpc.id
  resource_group = var.rg_id
  zone           = "${var.region}-1"
  tags           = var.tags
}

resource "ibm_is_subnet" "vpc_tier1_zone_1" {
  vpc             = ibm_is_vpc.vpc_vpc.id
  name            = "${var.prefix}-vpc-tier1-zone-1"
  zone            = "${var.region}-1"
  resource_group  = var.rg_id
  tags            = var.tags
  network_acl     = ibm_is_network_acl.vpc_default_acl.id
  ipv4_cidr_block = "10.10.0.0/26"
  depends_on = [
    ibm_is_vpc_address_prefix.vpc_vpc_zone_1_prefix
  ]
}

##############################################################################
