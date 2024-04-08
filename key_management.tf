##############################################################################
# Key Management Instance Kms
##############################################################################

resource "ibm_resource_instance" "kms" {
  name              = "${var.prefix}-kms"
  resource_group_id = ibm_resource_group.rg.id
  service           = "kms"
  plan              = "tiered-pricing"
  location          = var.region
  tags = [
    "stacks",
    "epx",
    "projects"
  ]
}

resource "ibm_iam_authorization_policy" "kms_server_protect_policy" {
  source_service_name         = "server-protect"
  target_service_name         = "kms"
  target_resource_instance_id = ibm_resource_instance.kms.guid
  description                 = "Allow block storage volumes to be encrypted by Key Management instance."
  roles = [
    "Reader"
  ]
}

resource "ibm_iam_authorization_policy" "kms_block_storage_policy" {
  source_service_name         = "is"
  target_service_name         = "kms"
  target_resource_instance_id = ibm_resource_instance.kms.guid
  description                 = "Allow block storage volumes to be encrypted by Key Management instance."
  source_resource_type        = "share"
  roles = [
    "Reader",
    "Authorization Delegator"
  ]
}

resource "ibm_kms_key_rings" "kms_default_ring" {
  key_ring_id = "${var.prefix}-kms-default"
  instance_id = ibm_resource_instance.kms.guid
}

resource "ibm_kms_key" "kms_key1_key" {
  instance_id   = ibm_resource_instance.kms.guid
  key_name      = "${var.prefix}-kms-key1"
  standard_key  = false
  key_ring_id   = ibm_kms_key_rings.kms_default_ring.key_ring_id
  force_delete  = true
  endpoint_type = "private"
  depends_on = [
    ibm_iam_authorization_policy.kms_server_protect_policy,
    ibm_iam_authorization_policy.kms_block_storage_policy
  ]
}

resource "ibm_kms_key_policies" "kms_key1_key_policy" {
  instance_id   = ibm_resource_instance.kms.guid
  endpoint_type = "private"
  key_id        = ibm_kms_key.kms_key1_key.key_id
  rotation {
    interval_month = "1"
  }
  dual_auth_delete {
    enabled = false
  }
}

##############################################################################

