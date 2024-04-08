##############################################################################
# Vpc VPC Outputs
##############################################################################

output "name" {
  value = ibm_is_vpc.vpc_vpc.name
}

output "id" {
  value = ibm_is_vpc.vpc_vpc.id
}

output "crn" {
  value = ibm_is_vpc.vpc_vpc.crn
}

output "tier1_zone_1_name" {
  value = ibm_is_subnet.vpc_tier1_zone_1.name
}

output "tier1_zone_1_id" {
  value = ibm_is_subnet.vpc_tier1_zone_1.id
}

output "tier1_zone_1_crn" {
  value = ibm_is_subnet.vpc_tier1_zone_1.crn
}

output "sg1_name" {
  value = ibm_is_security_group.vpc_vpc_sg1_sg.name
}

output "sg1_id" {
  value = ibm_is_security_group.vpc_vpc_sg1_sg.id
}

##############################################################################
