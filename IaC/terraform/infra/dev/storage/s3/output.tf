output "s3_pub_id" {
  value = module.s3_pub.s3_bucket_id
}

output "s3_pub_arn" {
  value = module.s3_pub.s3_bucket_arn
}

output "s3_priv_id" {
  value = module.s3_priv.s3_bucket_id
}

output "s3_priv_arn" {
  value = module.s3_priv.s3_bucket_arn
}

output "s3_endpoint_id" {
  value = module.s3_priv.vpc_endpoint_id
}



