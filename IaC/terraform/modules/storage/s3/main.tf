resource "aws_s3_bucket" "s3" {
  bucket        = var.bucket_name
  force_destroy = true

  tags = {
    Deployment_mode = var.deployment_mode
  }
}

resource "aws_s3_bucket_ownership_controls" "s3_bucket_acl_ownership" {
  bucket = aws_s3_bucket.s3.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "public_access_block" {
  bucket = aws_s3_bucket.s3.id

  block_public_acls       = var.acl == "private"
  block_public_policy     = var.acl == "private"
  ignore_public_acls      = var.acl == "private"
  restrict_public_buckets = var.acl == "private"
}

resource "aws_s3_bucket_acl" "bucket_acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = var.acl

  depends_on = [
    aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership,
    aws_s3_bucket_public_access_block.public_access_block,
  ]
}

resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.s3.id
  policy = templatefile(
    var.policy_file,
    {
      bucket_arn      = aws_s3_bucket.s3.arn
      vpc_endpoint_id = var.create_endpoint ? aws_vpc_endpoint.s3_endpoint[0].id : ""
      allowed_ip      = var.allowed_ip
    }
  )

  depends_on = [
    aws_s3_bucket_public_access_block.public_access_block,
    aws_vpc_endpoint.s3_endpoint
  ]
}

resource "aws_s3_object" "object" {
  count        = var.upload_obj ? 1 : 0
  bucket       = aws_s3_bucket.s3.id
  key          = basename(var.obj_path)
  source       = var.obj_path
  content_type = "image/jpeg"

}

resource "aws_vpc_endpoint" "s3_endpoint" {
  count             = var.create_endpoint && var.acl == "private" ? 1 : 0
  vpc_id            = var.vpc_id
  service_name      = var.service_name
  vpc_endpoint_type = "Gateway"

  tags = {
    Name            = "${var.bucket_name}-s3-endpoint"
    Deployment_mode = var.deployment_mode
  }
}

resource "aws_vpc_endpoint_route_table_association" "s3_endpoint_route" {
  count           = var.create_endpoint && var.acl == "private" ? length(var.route_table_ids) : 0
  route_table_id  = var.route_table_ids[count.index]
  vpc_endpoint_id = aws_vpc_endpoint.s3_endpoint[0].id
}
