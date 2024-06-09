resource "aviatrix_vpc" "spoke2vpc2" {
  name                = "spoke2vpc2"
  account_name        = var.aviatrixaccountname
  cloud_type          = 1
  region              = var.regions[1]
  cidr                = var.spoke2cidr2
  num_of_subnet_pairs = 1
  subnet_size         = 24

}

resource "aviatrix_spoke_gateway" "spoke2" {
  account_name     = var.aviatrixaccountname
  cloud_type       = 1
  gw_name          = var.gwnames[1]
  gw_size          = var.gwsizes[0]
  vpc_id           = aviatrix_vpc.spoke2vpc2.vpc_id
  vpc_reg          = aviatrix_vpc.spoke2vpc2.region
  subnet           = var.spoke2publicsubnets2[0]
  single_ip_snat   = true
  allocate_new_eip = true

}

resource "aviatrix_spoke_transit_attachment" "link2" {
  spoke_gw_name   = aviatrix_spoke_gateway.spoke2.gw_name
  transit_gw_name = aviatrix_transit_gateway.transit1.gw_name
}


resource "aws_instance" "webserver" {
  ami                    = var.instancelists["instami2east2"]
  instance_type          = var.gwsizes[0]
  key_name               = var.instancelists["instkey2"]
  vpc_security_group_ids = [aws_security_group.websecuritygrps.id]
  subnet_id              = var.spoke2privatesubnets2[0]
  ebs_block_device {
    device_name = "/dev/sdw"
    volume_size = 8
    volume_type = "gp2"
    encrypted   = false
  }
  user_data = jsonencode("./web.sh")
  tags = {
    "Name" = "webserver"
  }
  provider = aws.region2site
}