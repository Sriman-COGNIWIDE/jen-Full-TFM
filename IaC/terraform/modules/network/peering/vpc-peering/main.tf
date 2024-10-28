resource "aws_vpc_peering_connection" "peering" {
  peer_vpc_id = var.acceptor_vpc_id
  vpc_id      = var.requestor_vpc_id
  auto_accept = true

  tags = {
    Name            = "VPC Peering"
    Deployment_mode = var.deployment_mode
  }
}

resource "aws_route" "peer_rt" {
  count                     = length(var.rt_1)
  route_table_id            = var.rt_1[count.index]
  destination_cidr_block    = var.rt_2[count.index]
  vpc_peering_connection_id = aws_vpc_peering_connection.peering.id
}

