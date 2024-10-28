module "s3_pub" {
  source      = "../../../../modules/storage/s3"
  bucket_name = "pub-s3-01"
  acl         = "public-read"
  obj_path    = "${path.module}/alex.jpg"
  upload_obj  = true
  policy_file = "${path.module}/json/public_pol.json"
  deployment_mode = "terraform"
}

module "s3_priv" {
  source          = "../../../../modules/storage/s3"
  bucket_name     = "priv-s3-final-002"
  acl             = "private"
  obj_path        = "${path.module}/Alexander-the-Great-temple.jpg"
  upload_obj      = true
  create_endpoint = true
  vpc_id          = data.terraform_remote_state.nets.outputs.net_b_id
  service_name    = "com.amazonaws.us-east-1.s3"
  allowed_ip      = ["${chomp(data.http.myip.response_body)}/32"]
  route_table_ids = [data.terraform_remote_state.nets.outputs.app_rt_id]
  policy_file     = "${path.module}/json/private_pol.json"
  deployment_mode = "terraform"
}
