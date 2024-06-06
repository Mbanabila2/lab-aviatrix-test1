regions                  = ["us-east-1", "us-east-2"]
controllerIp             = "100.27.81.125"
usernames                = "admin"
passwords                = "Ms5612022!@"
myaccounts               = "myaccountslab"
zones                    = ["us-east-1a", "us-east-2a"]
spoke1subnets            = [spoke1_public_subnet.value, spoke1_private_subnet.value]
spoke2subnets            = [spoke2_public_subnet.value, spoke2_private_subnet.value]
transit1subnets          = [transit1_public_subnet.value, transit1_private_subnet.value]
gwsizes                  = ["t2.micro", "t3.micro"]
gwnames                  = ["spoke1", "spoke2", "transit1"]
aviatrix_vpc_names       = ["spoke1vpc1", "spoke2vpc2", "transit1vpc1"]
aviatrix_transit_gwnames = [aviatrix_transit_gwname.value]
spoke1_vpcid             = [spoke1vpcid.value]
spoke2_vpcid             = [spoke2vpcid.value]
spoke1securitygroups     = [spoke1securitygroup.value]
spoke2securitygroups     = [spoke2securitygroup.value]
myips                    = "41.79.196.63/32"
instancelists = {
  "instami1" : "",
  "instami2" : "",
  "instkeys1" : "",
  "instkeys2" : "",
}