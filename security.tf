resource "aws_security_group" "bastionsecuritygrps" {
  name   = "secure1"
  vpc_id = var.spoke1vpcid[0]
  ingress = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.myips]
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = []
      self             = false
      description      = ""
    },
    {
      from_port        = 0
      to_port          = 0
      protocol         = "icmp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = [var.spoke1securitygrp1[0]]
      self             = false
      description      = ""
    },
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = [var.spoke1securitygrp1[0]]
      self             = false
      description      = ""
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = [var.spoke1securitygrp1[0]]
      self             = false
      description      = ""
    },
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = [var.spoke1securitygrp1[0]]
      self             = false
      description      = ""
    },
  ]
  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [var.trafficipv4any]
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = []
      self             = false
      description      = ""
    },
  ]
  tags = {
    "Name" = "bastionsecuritygrps"
  }
  provider = aws.region1site
}




resource "aws_security_group" "websecuritygrps" {
  name   = "websecure2"
  vpc_id = var.spoke2vpcid[0]
  ingress = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.myips]
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = []
      self             = false
      description      = ""
    },
    {
      from_port        = 0
      to_port          = 0
      protocol         = "icmp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = [var.spoke2securitygrp2[0]]
      self             = false
      description      = ""
    },
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = [var.spoke2securitygrp2[0]]
      self             = false
      description      = ""
    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = [var.spoke2securitygrp2[0]]
      self             = false
      description      = ""
    },
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = [var.spoke2securitygrp2[0]]
      self             = false
      description      = ""
    },
  ]
  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [var.trafficipv4any]
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      security_groups  = []
      self             = false
      description      = ""
    },
  ]
  tags = {
    "Name" = "websecuritygrps"
  }
  provider = aws.region2site
}