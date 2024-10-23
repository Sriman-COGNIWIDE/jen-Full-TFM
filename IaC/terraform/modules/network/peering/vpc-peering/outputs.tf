output "peer_id" {
  value       = aws_vpc_peering_connection.peering.id
  description = "Peer connection ID"
} 