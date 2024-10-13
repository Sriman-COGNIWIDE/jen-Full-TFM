resource "aws_s3_bucket" "s3" {
  bucket        = var.bucket_name
  force_destroy = true
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

  policy = var.acl == "private" ? jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "VPCEndpointAccess"
        Effect    = "Allow"
        Principal = "*"
        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket",
          "s3:GetBucketLocation"
        ]
        Resource = [
          aws_s3_bucket.s3.arn,
          "${aws_s3_bucket.s3.arn}/*"
        ]
        Condition = var.create_endpoint ? {
          StringEquals = {
            "aws:SourceVpce" = aws_vpc_endpoint.s3_endpoint[0].id
          }
        } : null
      }
    ]
    }) : jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.s3.arn}/*"
      }
    ]
  })

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

  depends_on = [aws_s3_bucket_acl.bucket_acl]
}

resource "aws_vpc_endpoint" "s3_endpoint" {
  count             = var.create_endpoint && var.acl == "private" ? 1 : 0
  vpc_id            = var.vpc_id
  service_name      = var.service_name
  vpc_endpoint_type = "Gateway"

  tags = {
    Name = "${var.bucket_name}-s3-endpoint"
  }
}

resource "aws_vpc_endpoint_route_table_association" "s3_endpoint_route" {
  count           = var.create_endpoint && var.acl == "private" ? length(var.route_table_ids) : 0
  route_table_id  = var.route_table_ids[count.index]
  vpc_endpoint_id = aws_vpc_endpoint.s3_endpoint[0].id
}

# resource "aws_iam_policy" "s3_access_policy" {
#   count       = var.acl == "private" ? 1 : 0
#   name        = "${var.bucket_name}-access-policy"
#   description = "IAM policy for accessing the private S3 bucket"

#   policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "s3:GetObject",
#           "s3:PutObject",
#           "s3:DeleteObject",
#           "s3:ListBucket",
#           "s3:GetBucketLocation"
#         ]
#         Resource = [
#           aws_s3_bucket.s3.arn,
#           "${aws_s3_bucket.s3.arn}/*"
#         ]
#       },
#       {
#         Effect   = "Deny"
#         Action   = "s3:ListAllMyBuckets"
#         Resource = "*"
#       }
#     ]
#   })
# }

