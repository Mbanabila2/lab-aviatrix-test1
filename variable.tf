variable "regions" {
  type = list(any)
}
variable "aviatrixcontrollerip" {
  type = string
}
variable "aviatrixusername" {
  type = string
}
variable "aviatrixpasswd" {
  type = string
}
variable "spoke1cidr1" {
  type = string
}
variable "spoke2cidr2" {
  type = string
}
variable "transit1cidr1" {
  type = string
}
variable "zones" {
  type = list(any)
}

variable "aviatrixaccountname" {
  type = string
}
variable "gwnames" {
  type = list(any)
}
variable "gwsizes" {
  type = list(any)
}
variable "spoke1publicsubnets1" {
  type = list(any)
}
variable "spoke1privatesubnets1" {
  type = list(any)
}

variable "transit1publicsubnets1" {
  type = list(any)
}
variable "transit1privatesubnets1" {
  type = list(any)
}

variable "spoke2publicsubnets2" {
  type = list(any)
}
variable "spoke2privatesubnets2" {
  type = list(any)
}

variable "instancelists" {
  type = map(any)
}
variable "spoke1vpcid" {
  type = list(any)
}
variable "spoke2vpcid" {
  type = list(any)
}
variable "myips" {
  type = string
}
variable "spoke1securitygrp1" {
  type = list(any)
}
variable "spoke2securitygrp2" {
  type = list(any)
}
variable "trafficipv4any" {
  type = string
}