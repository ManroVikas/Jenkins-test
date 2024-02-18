resource "aws_vpc" "S1_1" {
  cidr_block = var.vpc_cidr_block
  tags = {
      Name: "210029_VPC_${var.env_prefix}_S1_1"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
  }
}

 resource "aws_internet_gateway" "IGW_S1_1" {
    vpc_id = aws_vpc.S1_1.id
    tags = {
        Name: "210029_IGW_${var.env_prefix}_S1_1"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_subnet" "SUB1_S1_1a" {
    vpc_id = aws_vpc.S1_1.id
    cidr_block = var.SUB1_S1_1a_cidr_block
    availability_zone = var.avail_zone_1
    tags = {
        Name: "210029_SUB1_${var.env_prefix}_S1_1a"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_subnet" "SUB1_S1_1b" {
    vpc_id = aws_vpc.S1_1.id
    cidr_block = var.SUB1_S1_1b_cidr_block
    availability_zone = var.avail_zone_2
    tags = {
        Name: "210029_SUB1_${var.env_prefix}_S1_1b"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_subnet" "SUB2_S1_1a" {
    vpc_id = aws_vpc.S1_1.id
    cidr_block = var.SUB2_S1_1a_cidr_block
    availability_zone = var.avail_zone_1
    tags = {
        Name: "210029_SUB2_${var.env_prefix}_S1_1a"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_subnet" "SUB2_S1_1b" {
    vpc_id = aws_vpc.S1_1.id
    cidr_block = var.SUB2_S1_1b_cidr_block
    availability_zone = var.avail_zone_2
    tags = {
        Name: "210029_SUB2_${var.env_prefix}_S1_1b"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_subnet" "SUB3_S1_1a" {
    vpc_id = aws_vpc.S1_1.id
    cidr_block = var.SUB3_S1_1a_cidr_block
    availability_zone = var.avail_zone_1
    tags = {
        Name: "210029_SUB3_${var.env_prefix}_S1_1a"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"

    }
}

resource "aws_subnet" "SUB3_S1_1b" {
    vpc_id = aws_vpc.S1_1.id
    cidr_block = var.SUB3_S1_1b_cidr_block
    availability_zone = var.avail_zone_2
    tags = {
        Name: "210029_SUB3_${var.env_prefix}_S1_1b"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_subnet" "SUB4_S1_1a" {
    vpc_id = aws_vpc.S1_1.id
    cidr_block = var.SUB4_S1_1a_cidr_block
    availability_zone = var.avail_zone_1
    tags = {
        Name: "210029_SUB4_${var.env_prefix}_S1_1a"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_subnet" "SUB4_S1_1b" {
    vpc_id = aws_vpc.S1_1.id
    cidr_block = var.SUB4_S1_1b_cidr_block
    availability_zone = var.avail_zone_2
    tags = {
        Name: "210029_SUB4_${var.env_prefix}_S1_1b"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name       = "main"
  subnet_ids = [aws_subnet.SUB4_S1_1a.id, aws_subnet.SUB4_S1_1b.id]

  tags = {
    Name = "My DB subnet group"
  }
}

resource "aws_route_table" "RTB1_S1_1" {
    vpc_id = aws_vpc.S1_1.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW_S1_1.id
    }

    tags = {
        Name: "210029_RTB1_${var.env_prefix}_S1_1"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_route_table_association" "RTB1_S1_1a" {
  subnet_id      = aws_subnet.SUB1_S1_1a.id
  route_table_id = aws_route_table.RTB1_S1_1.id
}

resource "aws_route_table_association" "RTB1_S1_1b" {
  subnet_id      = aws_subnet.SUB1_S1_1b.id
  route_table_id = aws_route_table.RTB1_S1_1.id
}


resource "aws_route_table" "RTB2_S1_1" {
    vpc_id = aws_vpc.S1_1.id

    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public-nat-gtw.id
    }
    tags = {
        Name: "210029_RTB2_${var.env_prefix}_S1_1"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_route_table_association" "RTB2_S1_1a" {
  subnet_id = aws_subnet.SUB2_S1_1a.id
  route_table_id = aws_route_table.RTB2_S1_1.id
}

resource "aws_route_table_association" "RTB2_S1_1b" {
  subnet_id = aws_subnet.SUB2_S1_1b.id
  route_table_id = aws_route_table.RTB2_S1_1.id
}


resource "aws_route_table" "RTB3_S1_1" {
    vpc_id = aws_vpc.S1_1.id

    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public-nat-gtw.id
    }
    tags = {
        Name: "210029_RTB3_${var.env_prefix}_S1_1"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_route_table_association" "RTB3_S1_1a" {
  subnet_id = aws_subnet.SUB3_S1_1a.id
  route_table_id = aws_route_table.RTB3_S1_1.id
}

resource "aws_route_table_association" "RTB3_S1_1b" {
  subnet_id = aws_subnet.SUB3_S1_1b.id
  route_table_id = aws_route_table.RTB3_S1_1.id
}

resource "aws_route_table" "RTB4_S1_1" {
    vpc_id = aws_vpc.S1_1.id

    route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.public-nat-gtw.id
    }
    tags = {
        Name: "210029_RTB4_${var.env_prefix}_S1_1"
        CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
    }
}

resource "aws_route_table_association" "RTB4_S1_1a" {
  subnet_id = aws_subnet.SUB4_S1_1a.id
  route_table_id = aws_route_table.RTB4_S1_1.id
}

resource "aws_route_table_association" "RTB4_S1_1b" {
  subnet_id = aws_subnet.SUB4_S1_1b.id
  route_table_id = aws_route_table.RTB4_S1_1.id
}

#elastic ip for nat gagteway
resource "aws_eip" "nat_eip" {
vpc = true
tags = {
  Name = "210029_NAT_${var.env_prefix}_EIP"
  CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
}
}

#creating nat gateway
resource "aws_nat_gateway" "public-nat-gtw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.SUB1_S1_1a.id

  tags = {
    Name = "210029_NAT_${var.env_prefix}_S1_1a"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
  }
}

#create vpn gateway
resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = aws_vpc.S1_1.id

  tags = {
    Name = "210029_VGW_${var.env_prefix}_S1_1"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
  }
}

#create customer gateway
resource "aws_customer_gateway" "cgw" {
  bgp_asn    = 65000
  ip_address = "34.231.92.111"
  type       = "ipsec.1"

  tags = {
    Name = "210029_CGW_${var.env_prefix}_S1_1"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
  }
}

#vpc endpoint for s3 connectivity
resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.S1_1.id
  service_name = "com.amazonaws.${var.region}.s3"

  tags = {
    Environment = "210029_ENDPOINT_${var.env_prefix}_S1_1"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"

  }
}


resource "aws_vpc_endpoint_policy" "s3-policy" {
 vpc_endpoint_id = aws_vpc_endpoint.s3.id
 policy = jsonencode({
 "Version": "2012-10-17",
 "Id": "ST DEV",
 "Statement": [
 {
 "Sid": "AllowS3Actions",
 "Effect": "Allow",
 "Principal": "*",
 "Action": [
 "s3:GetObject",
 "s3:ListBucket",
 "s3:ListObjects",
 "s3:PutObject"
 ],
 "Resource": [
 "arn:aws:s3:::210029-s3-dev-s1-1",
 "arn:aws:s3:::210029-s3-dev-s1-1/*"
 ],
 "Condition": {
 "StringEquals": {
 "aws:SourceVpc": "vpc-076494af93564b0c6"
 }
 }
 },
 {
 "Sid": "ST DEV",
 "Effect": "Allow",
 "Principal": "*",
 "Action": "s3:ListAllMyBuckets",
 "Resource": "*"
 }
 ]
})
}



resource "aws_vpc_endpoint_route_table_association" "rtb-endpoint" {
  route_table_id  = aws_route_table.RTB3_S1_1.id
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

#site to site vpn connectivity
resource "aws_vpn_connection" "site_to_site_vpn" {
  vpn_gateway_id      = aws_vpn_gateway.vpn_gw.id
  customer_gateway_id = aws_customer_gateway.cgw.id
  type                = "ipsec.1"
  static_routes_only  = true

  tags = {
    Name = "210029_VPN_${var.env_prefix}_S1_1"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
  }
}

resource "aws_vpn_connection_route" "routes" {
  destination_cidr_block = "10.246.2.0/26"
  vpn_connection_id      = aws_vpn_connection.site_to_site_vpn.id
}


resource "aws_vpn_gateway_route_propagation" "route_propagation_1" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
  route_table_id = aws_route_table.RTB1_S1_1.id
}

resource "aws_vpn_gateway_route_propagation" "route_propagation_2" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
  route_table_id = aws_route_table.RTB2_S1_1.id
}

resource "aws_vpn_gateway_route_propagation" "route_propagation_3" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
  route_table_id = aws_route_table.RTB3_S1_1.id
}

resource "aws_vpn_gateway_route_propagation" "route_propagation_4" {
  vpn_gateway_id = aws_vpn_gateway.vpn_gw.id
  route_table_id = aws_route_table.RTB4_S1_1.id
}


#create nacl for SUB1_S1_1
resource "aws_network_acl" "ACL1_S1_1" {
  vpc_id = aws_vpc.S1_1.id

  egress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "210029_ACL1_${var.env_prefix}_S1_1"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
  }
}

#associate nacl to public subnet
resource "aws_network_acl_association" "ACL1_S1_1a" {
  network_acl_id = aws_network_acl.ACL1_S1_1.id
  subnet_id      = aws_subnet.SUB1_S1_1a.id
}

resource "aws_network_acl_association" "ACL1_S1_1b" {
  network_acl_id = aws_network_acl.ACL1_S1_1.id
  subnet_id      = aws_subnet.SUB1_S1_1b.id
}

# create nacl for private subnet
resource "aws_network_acl" "ACL2_S1_1" {
  vpc_id = aws_vpc.S1_1.id

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }


  tags = {
    Name = "210029_ACL2_${var.env_prefix}_S1_1"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
  }
}

# attach nacl to private subnet
resource "aws_network_acl_association" "ACL2_S1_1a" {
  network_acl_id = aws_network_acl.ACL2_S1_1.id
  subnet_id      = aws_subnet.SUB2_S1_1a.id
}

resource "aws_network_acl_association" "ACL2_S1_1b" {
  network_acl_id = aws_network_acl.ACL2_S1_1.id
  subnet_id      = aws_subnet.SUB2_S1_1b.id
}

resource "aws_network_acl" "ACL3_S1_1" {
  vpc_id = aws_vpc.S1_1.id

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }


  tags = {
    Name = "210029_ACL3_${var.env_prefix}_S1_1"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
  }
}

# attach nacl to private subnet
resource "aws_network_acl_association" "ACL3_S1_1b" {
  network_acl_id = aws_network_acl.ACL3_S1_1.id
  subnet_id      = aws_subnet.SUB3_S1_1b.id
}

resource "aws_network_acl_association" "ACL3_S1_1a" {
  network_acl_id = aws_network_acl.ACL3_S1_1.id
  subnet_id      = aws_subnet.SUB3_S1_1a.id
}


resource "aws_network_acl" "ACL4_S1_1" {
  vpc_id = aws_vpc.S1_1.id

  egress {
    protocol   = "-1"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }


  ingress {
    protocol   = "-1"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "210029_ACL4_${var.env_prefix}_S1_1"
    CC-Project: "210029_DEV"
         Environment:   "DEV"
         Project:   "Charter Manufacturing"
        CC:        "210029_DEV_VPC"
        Customer-Code: "210029"
  }
}

# attach nacl to private subnet
resource "aws_network_acl_association" "ACL4_S1_1a" {
  network_acl_id = aws_network_acl.ACL4_S1_1.id
  subnet_id      = aws_subnet.SUB4_S1_1a.id
}

resource "aws_network_acl_association" "ACL4_S1_1b" {
  network_acl_id = aws_network_acl.ACL4_S1_1.id
  subnet_id      = aws_subnet.SUB4_S1_1b.id
}



output "vpc_id" {
  value       = aws_vpc.S1_1.id
}

output "SUB1_S1_1b" {
  value       = aws_subnet.SUB1_S1_1b.id
}

output "SUB4_S1_1a" {
  value       = aws_subnet.SUB4_S1_1a.id
}

output "SUB1_S1_1a" {
  value       = aws_subnet.SUB1_S1_1a.id
}

output "RDS_SUB_GROUP" {
  value       = aws_db_subnet_group.rds_subnet_group.id
}

output "app_subnet" {
  value       = aws_subnet.SUB3_S1_1a.id
}
output "s3-ep-prfx"{
value=aws_vpc_endpoint.s3.prefix_list_id
}
