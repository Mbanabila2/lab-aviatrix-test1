output "transit1_public_subnet" {
  value = aviatrix_vpc.transit1vpc1.public_subnets
}

output "transit1_private_subnet" {
  value = aviatrix_vpc.transit1vpc1.private_subnets
}

output "spoke1_public_subnet" {
  value = aviatrix_vpc.spoke1vpc1.public_subnets
}

output "spoke1_private_subnet" {
  value = aviatrix_vpc.spoke1vpc1.private_subnets
}

output "spoke1vpcid" {
  value = aviatrix_vpc.spoke1vpc1.vpc_id
}

output "spoke2vpcid" {
  value = aviatrix_vpc.spoke2vpc2.vpc_id
}

output "spoke2_public_subnet" {
  value = aviatrix_vpc.spoke2vpc2.public_subnets
}

output "spoke2_private_subnet" {
  value = aviatrix_vpc.spoke2vpc2.private_subnets
}

output "spoke1securitygroup" {
  value = aviatrix_spoke_gateway.spoke1.security_group_id
}

output "spoke2securitygroup" {
  value = aviatrix_spoke_gateway.spoke2.security_group_id
}