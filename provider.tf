terraform {
  required_providers {
    aviatrix = {
      source = "AviatrixSystems/aviatrix"
    }
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aviatrix" {
  controller_ip = var.aviatrixcontrollerip
  username      = var.aviatrixusername
  password      = var.aviatrixpasswd
}

provider "aws" {
  region = var.regions[0]
  alias  = "region1site"
}
provider "aws" {
  region = var.regions[1]
  alias  = "region2site"
}