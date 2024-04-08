##############################################################################
# Security Group Sg 1
##############################################################################

resource "ibm_is_security_group" "vpc_vpc_sg1_sg" {
  name           = "${var.prefix}-vpc-sg1-sg"
  vpc            = ibm_is_vpc.vpc_vpc.id
  resource_group = var.rg_id
  tags = [
    "stacks",
    "epx",
    "projects"
  ]
}

resource "ibm_is_security_group_rule" "vpc_vpc_sg1_sg_rule_all_in" {
  group     = ibm_is_security_group.vpc_vpc_sg1_sg.id
  remote    = "0.0.0.0/0"
  direction = "inbound"
}

resource "ibm_is_security_group_rule" "vpc_vpc_sg1_sg_rule_all_out" {
  group     = ibm_is_security_group.vpc_vpc_sg1_sg.id
  remote    = "0.0.0.0/8"
  direction = "outbound"
}

##############################################################################
