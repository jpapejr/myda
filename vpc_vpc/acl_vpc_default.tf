##############################################################################
# Vpc Default ACL
##############################################################################

resource "ibm_is_network_acl" "vpc_default_acl" {
  name           = "${var.prefix}-vpc-default-acl"
  vpc            = ibm_is_vpc.vpc_vpc.id
  resource_group = var.rg_id
  tags = [
    "stacks",
    "epx",
    "projects"
  ]
  rules {
    source      = "0.0.0.0/0"
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "inbound"
    name        = "all-in"
  }
  rules {
    source      = "0.0.0.0/0"
    action      = "allow"
    destination = "0.0.0.0/0"
    direction   = "outbound"
    name        = "allow-out"
  }
}

##############################################################################
