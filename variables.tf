##############################################################################
# Variables
##############################################################################

variable "ibmcloud_api_key" {
  description = "The IBM Cloud platform API key needed to deploy IAM enabled resources."
  type        = string
  sensitive   = true
}

variable "region" {
  description = "IBM Cloud Region where resources will be provisioned"
  type        = string
  default     = "us-east"
}

variable "prefix" {
  description = "Name prefix that will be prepended to named resources"
  type        = string
  default     = "epx"
}

##############################################################################
