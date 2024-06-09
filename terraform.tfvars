regions                 = ["us-east-1", "us-east-2"]
aviatrixcontrollerip    = ""
aviatrixpasswd          = "admin"
aviatrixusername        = "Ms!@5612022"
spoke1cidr1             = "38.128.0.0/16"
spoke2cidr2             = "39.128.0.0/16"
transit1cidr1           = "38.192.0.0/16"
zones                   = ["us-east-1a", "us-east-2a"]
aviatrixaccountname     = "myaccountslab"
gwnames                 = ["spoke1", "spoke2", "transit1"]
gwsizes                 = ["t2.micro", "t3.micro"]
spoke1publicsubnets1    = [spoke1publicsubnet]
spoke1privatesubnets1   = [spoke1privatesubnet]
transit1privatesubnets1 = [transit1privatesubnet]
transit1publicsubnets1  = [transit1publicsubnet]
spoke2privatesubnets2   = [spoke1privatesubnet]
spoke2publicsubnets2    = [spoke1publicsubnet]
instancelists = {
  "instami1east1" : "ami-04b70fa74e45c3917",
  "instami2east2" : "ami-09040d770ffe2224f",
  "instkey1" : "key2seast1",
  "instkey2" : "keys1labeast2",
}
spoke1vpcid        = [spoke1vpcid1]
spoke2vpcid        = [spoke2vpcid2]
myips              = "41.79.196.67/32"
spoke1securitygrp1 = [spoke1secgrp]
spoke2securitygrp2 = [spoke2secgrp]
trafficipv4any     = "0.0.0.0/0"
