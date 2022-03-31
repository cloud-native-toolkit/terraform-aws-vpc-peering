locals {
  name_prefix = var.name_prefix
}
data "aws_vpc" "id1" {
  id = var.vpc_id1
}

data "aws_vpc" "id2" {
  id = var.vpc_id2
}

resource "aws_vpc_peering_connection" "vpc1tovpc2" {
  # VPC ID - 1.
  vpc_id = var.vpc_id1

  peer_owner_id = data.aws_vpc.id1.owner_id

  # VPC ID - 2.
  peer_vpc_id = var.vpc_id2

  # Works if both VPCs are owned by the same account.
  auto_accept = true
  tags = {
    Name = local.name_prefix
  }

}

#Update Route Table in VPC1

resource "aws_route" "vpc1tovpc2" {
  # ID of VPC 1 main route table.
  route_table_id = data.aws_vpc.id1.main_route_table_id

  # CIDR block / IP range for VPC 2.
  destination_cidr_block = data.aws_vpc.id2.cidr_block

  # ID of VPC peering connection.
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1tovpc2.id
}

#Update Route Table in VPC2

resource "aws_route" "vpc2tovpc1" {
  # ID of VPC 2 main route table.
  route_table_id = data.aws_vpc.id2.main_route_table_id

  # CIDR block / IP range for VPC 1.
  destination_cidr_block = data.aws_vpc.id1.cidr_block

  # ID of VPC peering connection.
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1tovpc2.id
}
