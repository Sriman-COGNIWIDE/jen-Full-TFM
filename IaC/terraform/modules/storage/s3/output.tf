output "s3_bucket_id" {
  value       = aws_s3_bucket.s3.id
  description = "id for the created bucket"
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.s3.arn
  description = "arn for the bucket created"
}

output "vpc_endpoint_id" {
  value       = var.create_endpoint && var.acl == "private" ? aws_vpc_endpoint.s3_endpoint[0].id : null
  description = "created vpc endpoint id"
}