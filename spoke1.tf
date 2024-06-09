resource "aviatrix_vpc" "spoke1vpc1" {
  name                = "spoke1vpc1"
  account_name        = var.aviatrixaccountname
  cloud_type          = 1
  region              = var.regions[0]
  cidr                = var.spoke1cidr1
  num_of_subnet_pairs = 1
  subnet_size         = 24

}

resource "aviatrix_spoke_gateway" "spoke1" {
  account_name     = var.aviatrixaccountname
  cloud_type       = 1
  gw_name          = var.gwnames[0]
  gw_size          = var.gwsizes[0]
  vpc_id           = aviatrix_vpc.spoke1vpc1.vpc_id
  vpc_reg          = aviatrix_vpc.spoke1vpc1.region
  subnet           = var.spoke1publicsubnets1[0]
  allocate_new_eip = true

}

resource "aviatrix_spoke_transit_attachment" "link1" {
  spoke_gw_name   = aviatrix_spoke_gateway.spoke1.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit1.gw_name
}


resource "aws_instance" "bastion1" {
  ami                    = var.instancelists["instami1east1"]
  instance_type          = var.gwsizes[0]
  key_name               = var.instancelists["instkey1"]
  vpc_security_group_ids = [aws_security_group.bastionsecuritygrps.id]
  subnet_id              = var.spoke1publicsubnets1[0]
  ebs_block_device {
    device_name = "/dev/sdi"
    volume_size = 8
    volume_type = "gp2"
    encrypted   = false
  }
  user_data = jsonencode("./web.sh")
  tags = {
    "Name" = "bastion1"
  }
  provider = aws.region1site
}