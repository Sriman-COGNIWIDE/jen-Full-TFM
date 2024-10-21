output "nat_id" {
  value       = var.create_nat ? aws_nat_gateway.nat-1[0].id : null
  description = "NAT ID"
}

output "igw_id" {
  value       = var.create_igw ? aws_internet_gateway.igw-1[0].id : null
  description = "IGW ID"
}
