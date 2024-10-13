resource "aws_vpc_peering_connection" "vpc1_to_vpc2" {
  peer_vpc_id = var.acceptor_vpc_id
  vpc_id      = var.requestor_vpc_id
  auto_accept = true

  tags = {
    Name = "VPC Peering between VPC1 and VPC2"
  }
}

resource "aws_route" "peer_rt_1" {
  route_table_id            = var.requestor_rt_id
  destination_cidr_block    = var.acceptor_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_to_vpc2.id
}

resource "aws_route" "peer_rt_2" {
  route_table_id            = var.acceptor_rt_id
  destination_cidr_block    = var.requestor_cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_to_vpc2.id
}

