##############################################################################
# Vpc VPC Outputs
##############################################################################

output "vpc_vpc_name" {
  value = module.vpc_vpc.name
}

output "vpc_vpc_id" {
  value = module.vpc_vpc.id
}

output "vpc_vpc_crn" {
  value = module.vpc_vpc.crn
}

output "vpc_vpc_subnet_tier1_zone_1_name" {
  value = module.vpc_vpc.tier1_zone_1_name
}

output "vpc_vpc_subnet_tier1_zone_1_id" {
  value = module.vpc_vpc.tier1_zone_1_id
}

output "vpc_vpc_subnet_tier1_zone_1_crn" {
  value = module.vpc_vpc.tier1_zone_1_crn
}

output "vpc_vpc_security_group_sg1_name" {
  value = module.vpc_vpc.sg1_name
}

output "vpc_vpc_security_group_sg1_id" {
  value = module.vpc_vpc.sg1_id
}

##############################################################################

##############################################################################
# Vpc Vpc VSI 1 Deployment Outputs
##############################################################################

output "vpc_vpc_vsi1_vsi_1_1_primary_ip_address" {
  value = ibm_is_instance.vpc_vpc_vsi1_vsi_1_1.primary_network_interface[0].primary_ip[0].address
}

##############################################################################
