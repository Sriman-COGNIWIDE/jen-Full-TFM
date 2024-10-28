output "peer_id" {
  value       = aws_vpc_peering_connection.peering.id
  description = "Unique connection ID for the peering"
} 