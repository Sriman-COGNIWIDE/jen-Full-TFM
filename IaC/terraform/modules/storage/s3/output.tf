output "s3_bucket_id" {
  value = aws_s3_bucket.s3.id
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.s3.arn
}

output "vpc_endpoint_id" {
  value = var.create_endpoint && var.acl == "private" ? aws_vpc_endpoint.s3_endpoint[0].id : null
}