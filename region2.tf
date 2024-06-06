resource "aviatrix_vpc" "spoke2vpc2" {
  name                = var.aviatrix_vpc_names[1]
  account_name        = var.myaccounts
  cloud_type          = 1
  cidr                = var.spoke2block
  region              = var.regions[1]
  num_of_subnet_pairs = 1
  subnet_size         = 24
}

resource "aviatrix_spoke_gateway" "spoke2" {
  account_name     = var.myaccounts
  cloud_type       = 1
  gw_name          = var.gwnames[1]
  gw_size          = var.gwsizes[0]
  vpc_id           = aviatrix_vpc.spoke1vpc1.vpc_id
  vpc_reg          = var.regions[1]
  subnet           = var.spoke2subnets[0]
  allocate_new_eip = true
  zone             = var.zones[1]
}


resource "aviatrix_spoke_transit_attachment" "link2" {
  spoke_gw_name   = aviatrix_spoke_gateway.spoke2.gw_name
  transit_gw_name = var.aviatrix_transit_gwnames[0]
}


resource "aws_instance" "webserver" {
  ami                    = var.instancelists["instami2"]
  instance_type          = var.gwsizes[0]
  key_name               = var.instancelists["instkey2"]
  subnet_id              = var.spoke2subnets[0]
  vpc_security_group_ids = [aws_security_group.web1secgrp.id]
  ebs_block_device {
    device_name = "/dev/sdp"
    volume_size = 8
    volume_type = "gp2"
    encrypted   = false
  }
  user_data = jsonencode("./web.sh")
  provider  = aws.region2site
}