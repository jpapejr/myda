##############################################################################
# Vpc VPC Variables
##############################################################################

variable "tags" {
  description = "List of tags"
  type        = list(string)
}

variable "region" {
  description = "IBM Cloud Region where resources will be provisioned"
  type        = string
}

variable "prefix" {
  description = "Name prefix that will be prepended to named resources"
  type        = string
}

variable "rg_id" {
  description = "ID for the resource group rg"
  type        = string
}

##############################################################################
