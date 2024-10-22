output "s3_pub_id" {
  description = "ID of the Public S3 created"
  value       = module.s3_pub.s3_bucket_id
}

output "s3_pub_arn" {
  description = "ARN of the Public S3 Created"
  value       = module.s3_pub.s3_bucket_arn
}

output "s3_priv_id" {
  description = "ID of the Private S3 created"
  value       = module.s3_priv.s3_bucket_id
}

output "s3_priv_arn" {
  description = "ARN of the Private S3 Created"
  value       = module.s3_priv.s3_bucket_arn
}

output "s3_endpoint_id" {
  description = "ID of the Endpoint created for Secure access of S3"
  value       = module.s3_priv.vpc_endpoint_id
}



