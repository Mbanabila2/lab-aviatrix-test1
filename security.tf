resource "aws_security_group" "bastion1secgrp" {
  name   = "secure1"
  vpc_id = var.spoke1_vpcid[0]
  ingress = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.myips]
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = []
      self             = false
    },
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = [var.spoke1securitygroups[0]]
      self             = false

    },
    {
      from_port        = 0
      to_port          = 0
      protocol         = "icmp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = [var.spoke1securitygroups[0]]
      self             = false

    },
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = [var.spoke1securitygroups[0]]
      self             = false

    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = [var.spoke1securitygroups[0]]
      self             = false

    },
  ]
  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = []
      self             = false

    }
  ]

  tags = {
    "Name" = "bastion1secgrp"
  }
  provider = aws.region1site
}

resource "aws_security_group" "web1secgrp" {
  name   = "secure2"
  vpc_id = var.spoke2_vpcid[0]
  ingress = [
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = [var.myips]
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = []
      self             = false
    },
    {
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = [var.spoke2securitygroups[0]]
      self             = false

    },
    {
      from_port        = 0
      to_port          = 0
      protocol         = "icmp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = [var.spoke2securitygroups[0]]
      self             = false

    },
    {
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = [var.spoke2securitygroups[0]]
      self             = false

    },
    {
      from_port        = 443
      to_port          = 443
      protocol         = "tcp"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = [var.spoke2securitygroups[0]]
      self             = false

    },
  ]
  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = []
      prefix_list_ids  = []
      ipv6_cidr_blocks = []
      description      = ""
      security_groups  = []
      self             = false
    }
  ]

  tags = {
    "Name" = "web1secgrp"
  }
  provider = aws.region2site
}