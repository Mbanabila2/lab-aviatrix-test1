resource "aviatrix_vpc" "trasit1vpc1" {
  name                = "transit1vpc1"
  account_name        = var.aviatrixaccountname
  cloud_type          = 1
  cidr                = var.transit1cidr1
  region              = var.regions[1]
  num_of_subnet_pairs = 1
  subnet_size         = 24
}

resource "aviatrix_transit_gateway" "transit1" {
  account_name = var.aviatrixaccountname
  cloud_type   = 1
  gw_name      = var.gwnames[2]
  gw_size      = var.gwsizes[0]
  vpc_id       = aviatrix_vpc.trasit1vpc1.vpc_id
  vpc_reg      = aviatrix_vpc.trasit1vpc1.region
  subnet       = var.transit1publicsubnets1[0]
}