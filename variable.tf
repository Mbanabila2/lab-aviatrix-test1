variable "regions" {
  type = list(any)
}
variable "controllerIp" {
  type = string
}
variable "usernames" {
  type = string
}
variable "passwords" {
  type = string
}
variable "myaccounts" {
  type = string
}
variable "transit1block" {
  type = string
}
variable "spoke1block" {
  type = string
}
variable "spoke2block" {
  type = string
}
variable "zones" {
  type = list(any)
}
variable "spoke1subnets" {
  type = list(any)
}
variable "spoke2subnets" {
  type = list(any)
}
variable "transit1subnets" {
  type = list(any)
}
variable "gwsizes" {
  type = list(any)
}
variable "gwnames" {
  type = list(any)
}
variable "aviatrix_vpc_names" {
  type = list(any)
}
variable "aviatrix_transit_gwnames" {
  type = list(any)
}
variable "spoke1_vpcid" {
  type = list(any)
}

variable "spoke2_vpcid" {
  type = list(any)
}

variable "spoke1securitygroups" {
  type = list(any)
}
variable "spoke2securitygroups" {
  type = list(any)
}
variable "myips" {
  type = string
}
variable "instancelists" {
  type = map(any)
}