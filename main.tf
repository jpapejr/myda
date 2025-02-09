##############################################################################
# IBM Cloud Provider
##############################################################################

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region           = var.region
  ibmcloud_timeout = 60
}

##############################################################################

##############################################################################
# Vpc VPC Module
##############################################################################

module "vpc_vpc" {
  source = "./vpc_vpc"
  region = var.region
  prefix = var.prefix
  rg_id  = ibm_resource_group.rg.id
  tags = [
    "stacks",
    "epx",
    "projects"
  ]
}

##############################################################################
