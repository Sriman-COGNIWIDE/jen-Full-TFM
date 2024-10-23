output "subnet_id" {
  value       = aws_subnet.subnet.id
  description = "Subnet ID"
}

output "subnet_cidr" {
  value       = aws_subnet.subnet.cidr_block
  description = "subet's cidr"
}