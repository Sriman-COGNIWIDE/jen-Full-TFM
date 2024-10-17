resource "aws_vpc_peering_connection" "vpc1_to_vpc2" {
  peer_vpc_id = var.acceptor_vpc_id
  vpc_id      = var.requestor_vpc_id
  auto_accept = true

  tags = {
    Name = "VPC Peering between VPC1 and VPC2"
  }
}

resource "aws_route" "peer_rt_1" {
  count                     = length(var.rt_1)
  route_table_id            = var.rt_1[count.index]
  destination_cidr_block    = var.rt_2[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc1_to_vpc2.id
}

