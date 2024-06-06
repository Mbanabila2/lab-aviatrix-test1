resource "aviatrix_vpc" "transit1vpc1" {
  name                = var.aviatrix_vpc_names[2]
  account_name        = var.myaccounts
  cloud_type          = 1
  cidr                = var.transit1block
  region              = var.regions[0]
  num_of_subnet_pairs = 1
  subnet_size         = 24
}
resource "aviatrix_vpc" "spoke1vpc1" {
  name                = var.aviatrix_vpc_names[0]
  account_name        = var.myaccounts
  cloud_type          = 1
  cidr                = var.spoke1block
  region              = var.regions[0]
  num_of_subnet_pairs = 1
  subnet_size         = 24
}

resource "aviatrix_transit_gateway" "transit1" {
  account_name     = var.myaccounts
  cloud_type       = 1
  gw_name          = var.gwnames[2]
  gw_size          = var.gwsizes[0]
  vpc_id           = aviatrix_vpc.transit1vpc1.vpc_id
  subnet           = var.transit1subnets[0]
  vpc_reg          = aviatrix_vpc.transit1vpc1.region
  allocate_new_eip = true
  zone             = var.zones[0]
}

resource "aviatrix_spoke_gateway" "spoke1" {
  account_name     = var.myaccounts
  cloud_type       = 1
  gw_name          = var.gwnames[0]
  gw_size          = var.gwsizes[0]
  vpc_id           = aviatrix_vpc.spoke1vpc1.vpc_id
  vpc_reg          = var.regions[0]
  subnet           = var.spoke1subnets[0]
  allocate_new_eip = true
  zone             = var.zones[0]
}

resource "aviatrix_spoke_transit_attachment" "link1" {
  spoke_gw_name   = aviatrix_spoke_gateway.spoke1.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit1.gw_name
}


resource "aviatrix_segmentation_network_domain" "domain1" {
  domain_name = "brown"
}

resource "aviatrix_segmentation_network_domain" "domain2" {
  domain_name = "green"
}


resource "aviatrix_segmentation_network_domain_association" "segmentlink1" {
  network_domain_name = aviatrix_segmentation_network_domain.domain1.domain_name
  attachment_name     = aviatrix_spoke_gateway.spoke1.id
}

resource "aviatrix_segmentation_network_domain_association" "segmentlink2" {
  network_domain_name = aviatrix_segmentation_network_domain.domain2.domain_name
  attachment_name     = aviatrix_spoke_gateway.spoke2.id

}

resource "aviatrix_segmentation_network_domain_connection_policy" "linkpolicy" {
  domain_name_1 = aviatrix_segmentation_network_domain.domain1.domain_name
  domain_name_2 = aviatrix_segmentation_network_domain.domain2.domain_name
}


resource "aws_instance" "bastion1" {
  ami                    = var.instancelists["instami1"]
  instance_type          = var.gwsizes[0]
  key_name               = var.instancelists["instkey1"]
  subnet_id              = var.spoke2subnets[0]
  vpc_security_group_ids = [aws_security_group.bastion1secgrp.id]
  ebs_block_device {
    device_name = "/dev/sdw"
    volume_size = 8
    volume_type = "gp2"
    encrypted   = false
  }
  user_data = jsonencode("./bastion1.sh")
  provider  = aws.region1site
}