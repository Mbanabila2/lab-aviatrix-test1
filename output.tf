output "spoke1publicsubnet" {
  value = aviatrix_vpc.spoke1vpc1.public_subnets
}
output "spoke1privatesubnet" {
  value = aviatrix_vpc.spoke1vpc1.private_subnets
}

output "transit1publicsubnet" {
  value = aviatrix_vpc.trasit1vpc1.public_subnets
}
output "transit1privatesubnet" {
  value = aviatrix_vpc.trasit1vpc1.private_subnets
}

output "spoke2publicsubnet" {
  value = aviatrix_vpc.spoke2vpc2.public_subnets
}
output "spoke2privatesubnet" {
  value = aviatrix_vpc.spoke2vpc2.private_subnets
}

output "spoke1vpcid1" {
  value = aviatrix_spoke_gateway.spoke1.vpc_id
}
output "spoke2vpcid2" {
  value = aviatrix_spoke_gateway.spoke2.vpc_id
}

output "spoke1secgrp" {
  value = aviatrix_spoke_gateway.spoke1.security_group_id
}
output "spoke2secgrp" {
  value = aviatrix_spoke_gateway.spoke2.security_group_id
}