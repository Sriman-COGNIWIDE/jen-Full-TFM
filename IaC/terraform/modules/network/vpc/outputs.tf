output "vpc_id" {
  value       = aws_vpc.vpcs.id
  description = "The ID of the VPC"
}

output "vpc_cidr_block" {
  value = aws_vpc.vpcs.cidr_block
}