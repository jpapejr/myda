##############################################################################
# SSH Keys
##############################################################################

data "ibm_is_ssh_key" "slurm_key" {
  name = "slurm-key"
}

##############################################################################
