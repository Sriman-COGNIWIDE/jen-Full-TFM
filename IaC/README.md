<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.72.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.72.1 |
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nlb"></a> [nlb](#module\_nlb) | ../../../../modules/compute/lb/nlb | n/a |
| <a name="module_vm_app_1"></a> [vm\_app\_1](#module\_vm\_app\_1) | ../../../../modules/compute/ec2 | n/a |
| <a name="module_vm_app_2"></a> [vm\_app\_2](#module\_vm\_app\_2) | ../../../../modules/compute/ec2 | n/a |
| <a name="module_vm_bastion"></a> [vm\_bastion](#module\_vm\_bastion) | ../../../../modules/compute/ec2 | n/a |
| <a name="module_vm_connect"></a> [vm\_connect](#module\_vm\_connect) | ../../../../modules/compute/ec2 | n/a |
| <a name="module_vm_nginx"></a> [vm\_nginx](#module\_vm\_nginx) | ../../../../modules/compute/ec2 | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_ami.amznlinux2023](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/ami) | data source |
| [aws_s3_object.recipe-app](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/s3_object) | data source |
| [http_http.user_ip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [terraform_remote_state.nets](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ami_id"></a> [ami\_id](#output\_ami\_id) | AMI ID used for creating Ec2 Instances |
| <a name="output_nlb_dns"></a> [nlb\_dns](#output\_nlb\_dns) | DNS of the Network Load Balancer |
| <a name="output_vm_app_1_id"></a> [vm\_app\_1\_id](#output\_vm\_app\_1\_id) | Instance ID of the VM\_APP\_1 |
| <a name="output_vm_app_1_priv_ip"></a> [vm\_app\_1\_priv\_ip](#output\_vm\_app\_1\_priv\_ip) | Private IP of VM\_APP\_1 |
| <a name="output_vm_app_1_tls_key"></a> [vm\_app\_1\_tls\_key](#output\_vm\_app\_1\_tls\_key) | Private pem key for the VM\_APP\_1 |
| <a name="output_vm_app_2_id"></a> [vm\_app\_2\_id](#output\_vm\_app\_2\_id) | Instance ID of the VM-APP-2 |
| <a name="output_vm_app_2_priv_ip"></a> [vm\_app\_2\_priv\_ip](#output\_vm\_app\_2\_priv\_ip) | Private IP of VM\_APP\_2 |
| <a name="output_vm_app_2_tls_key"></a> [vm\_app\_2\_tls\_key](#output\_vm\_app\_2\_tls\_key) | Private pem key for the VM\_APP\_2 |
| <a name="output_vm_app_sg_id"></a> [vm\_app\_sg\_id](#output\_vm\_app\_sg\_id) | Security Group ID of the VM\_APP\_1&2 |
| <a name="output_vm_bastion_public_ip"></a> [vm\_bastion\_public\_ip](#output\_vm\_bastion\_public\_ip) | Public IP of VM\_BASTION |
| <a name="output_vm_bastion_tls_key"></a> [vm\_bastion\_tls\_key](#output\_vm\_bastion\_tls\_key) | Private pem key for the VM\_BASTION |
| <a name="output_vm_connect_private_ip"></a> [vm\_connect\_private\_ip](#output\_vm\_connect\_private\_ip) | Private IP of the VM\_CONNECT |
| <a name="output_vm_connect_sg_id"></a> [vm\_connect\_sg\_id](#output\_vm\_connect\_sg\_id) | Security Group ID of the VM\_CONNECT |
| <a name="output_vm_connect_tls_key"></a> [vm\_connect\_tls\_key](#output\_vm\_connect\_tls\_key) | Private pem key for the VM\_CONNECT |
| <a name="output_vm_nginx_public_ip"></a> [vm\_nginx\_public\_ip](#output\_vm\_nginx\_public\_ip) | Public IP of VM\_NGINX |
| <a name="output_vm_nginx_tls_key"></a> [vm\_nginx\_tls\_key](#output\_vm\_nginx\_tls\_key) | Private pem key for the VM\_NGINX |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.72.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.72.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_rds_postgres"></a> [rds\_postgres](#module\_rds\_postgres) | ../../../modules/database | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.db_credentials](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.db_credentials](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/secretsmanager_secret_version) | data source |
| [terraform_remote_state.nets](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_random_pass"></a> [random\_pass](#output\_random\_pass) | Random password generated that is attached as password for the RDS Instance |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | RDS Endpoint for the created Database service |
| <a name="output_rds_instance_id"></a> [rds\_instance\_id](#output\_rds\_instance\_id) | RDS Instance ID for the created Database service |
| <a name="output_rds_security_group_id"></a> [rds\_security\_group\_id](#output\_rds\_security\_group\_id) | Security Group ID of the RDS Instance |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.72.1 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_gateway-a"></a> [gateway-a](#module\_gateway-a) | ../../../modules/network/gateway | n/a |
| <a name="module_gateway-b"></a> [gateway-b](#module\_gateway-b) | ../../../modules/network/gateway | n/a |
| <a name="module_net_a"></a> [net\_a](#module\_net\_a) | ../../../modules/network/vpc | n/a |
| <a name="module_net_a-subnets"></a> [net\_a-subnets](#module\_net\_a-subnets) | ../../../modules/network/subnet | n/a |
| <a name="module_net_b"></a> [net\_b](#module\_net\_b) | ../../../modules/network/vpc | n/a |
| <a name="module_net_b-subnets"></a> [net\_b-subnets](#module\_net\_b-subnets) | ../../../modules/network/subnet | n/a |
| <a name="module_subnet_a_rt"></a> [subnet\_a\_rt](#module\_subnet\_a\_rt) | ../../../modules/network/route-table | n/a |
| <a name="module_subnet_b_rt"></a> [subnet\_b\_rt](#module\_subnet\_b\_rt) | ../../../modules/network/route-table | n/a |
| <a name="module_subnet_bast_rt"></a> [subnet\_bast\_rt](#module\_subnet\_bast\_rt) | ../../../modules/network/route-table | n/a |
| <a name="module_subnet_c_rt"></a> [subnet\_c\_rt](#module\_subnet\_c\_rt) | ../../../modules/network/route-table | n/a |
| <a name="module_subnet_d_rt"></a> [subnet\_d\_rt](#module\_subnet\_d\_rt) | ../../../modules/network/route-table | n/a |
| <a name="module_vpc_peering"></a> [vpc\_peering](#module\_vpc\_peering) | ../../../modules/network/peering/vpc-peering | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_net_a-subnet"></a> [net\_a-subnet](#input\_net\_a-subnet) | Subnets in Network-A | <pre>map(object({<br/>    subnet_cidr = string<br/>    subnet_az   = string<br/>    subnet_name = string<br/>  }))</pre> | <pre>{<br/>  "subnet_a": {<br/>    "subnet_az": "us-east-1a",<br/>    "subnet_cidr": "10.0.1.0/24",<br/>    "subnet_name": "subnet-a"<br/>  },<br/>  "subnet_b": {<br/>    "subnet_az": "us-east-1b",<br/>    "subnet_cidr": "10.0.2.0/24",<br/>    "subnet_name": "subnet-b"<br/>  }<br/>}</pre> | no |
| <a name="input_net_b-subnet"></a> [net\_b-subnet](#input\_net\_b-subnet) | Subnets in Network-B | <pre>map(object({<br/>    subnet_cidr = string<br/>    subnet_az   = string<br/>    subnet_name = string<br/>  }))</pre> | <pre>{<br/>  "subnet_bast": {<br/>    "subnet_az": "us-east-1c",<br/>    "subnet_cidr": "10.1.1.0/24",<br/>    "subnet_name": "subnet_bast"<br/>  },<br/>  "subnet_c": {<br/>    "subnet_az": "us-east-1d",<br/>    "subnet_cidr": "10.1.2.0/24",<br/>    "subnet_name": "subnet_c"<br/>  },<br/>  "subnet_d": {<br/>    "subnet_az": "us-east-1e",<br/>    "subnet_cidr": "10.1.3.0/24",<br/>    "subnet_name": "subnet_d"<br/>  },<br/>  "subnet_e": {<br/>    "subnet_az": "us-east-1f",<br/>    "subnet_cidr": "10.1.4.0/24",<br/>    "subnet_name": "subnet_e"<br/>  }<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_app_rt_id"></a> [app\_rt\_id](#output\_app\_rt\_id) | Subnet C associated Route table ID (App subnet's Route table) |
| <a name="output_app_subnet_cidr"></a> [app\_subnet\_cidr](#output\_app\_subnet\_cidr) | Subnet CIDR of the subnet-C (App VM's Subnet) |
| <a name="output_app_subnet_id"></a> [app\_subnet\_id](#output\_app\_subnet\_id) | Subnet ID of the subnet-C (App Vm's Subnet) |
| <a name="output_bastion_rt_id"></a> [bastion\_rt\_id](#output\_bastion\_rt\_id) | Subnet Bast associated Route table ID (Bastion VM subnet's Route table) |
| <a name="output_bastion_subnet_cidr"></a> [bastion\_subnet\_cidr](#output\_bastion\_subnet\_cidr) | Subnet CIDR of the subnet-Bast (Bastion VM's Subnet) |
| <a name="output_bastion_subnet_id"></a> [bastion\_subnet\_id](#output\_bastion\_subnet\_id) | Subnet ID of the subnet-Bast (Bastion VM's Subnet) |
| <a name="output_connect_rt_id"></a> [connect\_rt\_id](#output\_connect\_rt\_id) | Subnet B associated Route table ID (Connect VM subnet's Route table) |
| <a name="output_connect_subnet_cidr"></a> [connect\_subnet\_cidr](#output\_connect\_subnet\_cidr) | Subnet CIDR of the subnet-B (Connect VM's Subnet) |
| <a name="output_connect_subnet_id"></a> [connect\_subnet\_id](#output\_connect\_subnet\_id) | Subnet ID of the subnet-B (Connect VM's Subnet) |
| <a name="output_db_rt_id"></a> [db\_rt\_id](#output\_db\_rt\_id) | Subnet D & E associated Route table ID (DB subnet's Route table) |
| <a name="output_db_subnet_1"></a> [db\_subnet\_1](#output\_db\_subnet\_1) | Subnet ID of the subnet-D (DB Subnet-1) |
| <a name="output_db_subnet_1_cidr"></a> [db\_subnet\_1\_cidr](#output\_db\_subnet\_1\_cidr) | Subnet CIDR of the subnet-D (DB Subnet) |
| <a name="output_db_subnet_2"></a> [db\_subnet\_2](#output\_db\_subnet\_2) | Subnet ID of the subnet-E (DB Subnet-2) |
| <a name="output_db_subnet_2_cidr"></a> [db\_subnet\_2\_cidr](#output\_db\_subnet\_2\_cidr) | Subnet CIDR of the subnet-E (DB Subnet) |
| <a name="output_igw_1_id"></a> [igw\_1\_id](#output\_igw\_1\_id) | Internet Gateway ID in Network A |
| <a name="output_igw_2_id"></a> [igw\_2\_id](#output\_igw\_2\_id) | Internet Gateway ID in Network B |
| <a name="output_nat_id"></a> [nat\_id](#output\_nat\_id) | NAT Gateway ID in Network B |
| <a name="output_net_a_id"></a> [net\_a\_id](#output\_net\_a\_id) | VPC ID of Network A (VPC-1) |
| <a name="output_net_b_id"></a> [net\_b\_id](#output\_net\_b\_id) | VPC ID of Network B (VPC-2) |
| <a name="output_nginx_rt_id"></a> [nginx\_rt\_id](#output\_nginx\_rt\_id) | Subnet A associated Route table ID (Nginx VM subnet's Route table) |
| <a name="output_nginx_subnet_cidr"></a> [nginx\_subnet\_cidr](#output\_nginx\_subnet\_cidr) | Subnet CIDR of the subnet-A (Nginx VM's Subnet) |
| <a name="output_nginx_subnet_id"></a> [nginx\_subnet\_id](#output\_nginx\_subnet\_id) | Subnet ID of the subnet-A (Nginx VM's Subnet) |
| <a name="output_vpc_peer_id"></a> [vpc\_peer\_id](#output\_vpc\_peer\_id) | VPC Peering ID used to Connect Network-A & Network-B |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.72.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.72.1 |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_delete_lambda"></a> [delete\_lambda](#module\_delete\_lambda) | ../../../../modules/serverless/lambda | n/a |
| <a name="module_delete_lambda_inegration"></a> [delete\_lambda\_inegration](#module\_delete\_lambda\_inegration) | ../../../../modules/serverless/api-gtw | n/a |
| <a name="module_get_by_id_lambda"></a> [get\_by\_id\_lambda](#module\_get\_by\_id\_lambda) | ../../../../modules/serverless/lambda | n/a |
| <a name="module_get_by_id_lambda_inegration"></a> [get\_by\_id\_lambda\_inegration](#module\_get\_by\_id\_lambda\_inegration) | ../../../../modules/serverless/api-gtw | n/a |
| <a name="module_get_lambda"></a> [get\_lambda](#module\_get\_lambda) | ../../../../modules/serverless/lambda | n/a |
| <a name="module_get_lambda_inegration"></a> [get\_lambda\_inegration](#module\_get\_lambda\_inegration) | ../../../../modules/serverless/api-gtw | n/a |
| <a name="module_http_api_gateway"></a> [http\_api\_gateway](#module\_http\_api\_gateway) | ../../../../modules/serverless/api-gtw | n/a |
| <a name="module_post_lambda"></a> [post\_lambda](#module\_post\_lambda) | ../../../../modules/serverless/lambda | n/a |
| <a name="module_post_lambda_inegration"></a> [post\_lambda\_inegration](#module\_post\_lambda\_inegration) | ../../../../modules/serverless/api-gtw | n/a |
| <a name="module_put_lambda"></a> [put\_lambda](#module\_put\_lambda) | ../../../../modules/serverless/lambda | n/a |
| <a name="module_put_lambda_inegration"></a> [put\_lambda\_inegration](#module\_put\_lambda\_inegration) | ../../../../modules/serverless/api-gtw | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_secretsmanager_secret.lambda_credentials](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/secretsmanager_secret) | data source |
| [aws_secretsmanager_secret_version.lambda_credentials](https://registry.terraform.io/providers/hashicorp/aws/5.72.1/docs/data-sources/secretsmanager_secret_version) | data source |
| [terraform_remote_state.dbs](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |
| [terraform_remote_state.nets](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output___gtw_url"></a> [\_\_gtw\_url](#output\_\_\_gtw\_url) | Endpoint URL for the HTTP API gateway |
| <a name="output_delete-recipe-arn"></a> [delete-recipe-arn](#output\_delete-recipe-arn) | ARN of the DELETE-recipe Lambda function |
| <a name="output_delete-recipe-id"></a> [delete-recipe-id](#output\_delete-recipe-id) | ID of the DELETE-recipe Lambda function |
| <a name="output_delete_recipe_output"></a> [delete\_recipe\_output](#output\_delete\_recipe\_output) | Output of the DELETE-recipe Lambda Invocation |
| <a name="output_get-by-id-recipe-arn"></a> [get-by-id-recipe-arn](#output\_get-by-id-recipe-arn) | ARN of the GET-BY-ID-recipe Lambda function |
| <a name="output_get-by-id-recipe-id"></a> [get-by-id-recipe-id](#output\_get-by-id-recipe-id) | ID of the GET-BY-ID-recipe Lambda function |
| <a name="output_get-recipe-arn"></a> [get-recipe-arn](#output\_get-recipe-arn) | ARN of the GET-recipe Lambda function |
| <a name="output_get-recipe-id"></a> [get-recipe-id](#output\_get-recipe-id) | ID of the GET-recipe Lambda function |
| <a name="output_get_by_id_recipe_output"></a> [get\_by\_id\_recipe\_output](#output\_get\_by\_id\_recipe\_output) | Output of the GET-BY-ID-recipe Lambda Invocation |
| <a name="output_get_recipe_output"></a> [get\_recipe\_output](#output\_get\_recipe\_output) | Output of the Get-recipe Lambda Invocation |
| <a name="output_http-api-gtw-arn"></a> [http-api-gtw-arn](#output\_http-api-gtw-arn) | ARN for the HTTP API gateway created |
| <a name="output_http-api-gtw-id"></a> [http-api-gtw-id](#output\_http-api-gtw-id) | API gateway ID for the HTTP API gateway created |
| <a name="output_lambda_role_arn"></a> [lambda\_role\_arn](#output\_lambda\_role\_arn) | ARN of the lamvda assume role |
| <a name="output_lambda_sg_id"></a> [lambda\_sg\_id](#output\_lambda\_sg\_id) | Security Group ID of the Lambda |
| <a name="output_layer_arn"></a> [layer\_arn](#output\_layer\_arn) | ARN of the layer created |
| <a name="output_post-recipe-arn"></a> [post-recipe-arn](#output\_post-recipe-arn) | ARN of the POST-recipe Lambda function |
| <a name="output_post-recipe-id"></a> [post-recipe-id](#output\_post-recipe-id) | ID of the POST-recipe Lambda function |
| <a name="output_post_recipe_output"></a> [post\_recipe\_output](#output\_post\_recipe\_output) | Output of the POST-recipe Lambda Invocation |
| <a name="output_put-recipe-arn"></a> [put-recipe-arn](#output\_put-recipe-arn) | ARN of the PUT-recipe Lambda function |
| <a name="output_put-recipe-id"></a> [put-recipe-id](#output\_put-recipe-id) | ID of the PUT-recipe Lambda function |
| <a name="output_put_recipe_output"></a> [put\_recipe\_output](#output\_put\_recipe\_output) | Output of the PUT-recipe Lambda Invocation |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.72.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | n/a |
| <a name="provider_terraform"></a> [terraform](#provider\_terraform) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_priv"></a> [s3\_priv](#module\_s3\_priv) | ../../../../modules/storage/s3 | n/a |
| <a name="module_s3_pub"></a> [s3\_pub](#module\_s3\_pub) | ../../../../modules/storage/s3 | n/a |

## Resources

| Name | Type |
|------|------|
| [http_http.myip](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |
| [terraform_remote_state.nets](https://registry.terraform.io/providers/hashicorp/terraform/latest/docs/data-sources/remote_state) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_endpoint_id"></a> [s3\_endpoint\_id](#output\_s3\_endpoint\_id) | ID of the Endpoint created for Secure access of S3 |
| <a name="output_s3_priv_arn"></a> [s3\_priv\_arn](#output\_s3\_priv\_arn) | ARN of the Private S3 Created |
| <a name="output_s3_priv_id"></a> [s3\_priv\_id](#output\_s3\_priv\_id) | ID of the Private S3 created |
| <a name="output_s3_pub_arn"></a> [s3\_pub\_arn](#output\_s3\_pub\_arn) | ARN of the Public S3 Created |
| <a name="output_s3_pub_id"></a> [s3\_pub\_id](#output\_s3\_pub\_id) | ID of the Public S3 created |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_null"></a> [null](#provider\_null) | n/a |
| <a name="provider_tls"></a> [tls](#provider\_tls) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_instance_profile.ec2_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource |
| [aws_iam_role.ec2_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.s3_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.secrets_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_instance.ec2_instance](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |
| [aws_key_pair.ec2_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_security_group.ec2_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [null_resource.ec2_prov_rmt](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [null_resource.ec2_prov_rmt_via_bastion](https://registry.terraform.io/providers/hashicorp/null/latest/docs/resources/resource) | resource |
| [tls_private_key.example](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_add_custom_policies"></a> [add\_custom\_policies](#input\_add\_custom\_policies) | enable custom iam policies | `bool` | `false` | no |
| <a name="input_add_policy_arns"></a> [add\_policy\_arns](#input\_add\_policy\_arns) | attach policy arn list | `bool` | `false` | no |
| <a name="input_allow_rmt_via_bastion"></a> [allow\_rmt\_via\_bastion](#input\_allow\_rmt\_via\_bastion) | enable bastion host access | `bool` | `false` | no |
| <a name="input_allow_rmte_exec"></a> [allow\_rmte\_exec](#input\_allow\_rmte\_exec) | enable remote command execution | `bool` | `false` | no |
| <a name="input_allow_user_data"></a> [allow\_user\_data](#input\_allow\_user\_data) | enable userdata script execution | `bool` | `false` | no |
| <a name="input_ami"></a> [ami](#input\_ami) | amazon machine image id | `string` | n/a | yes |
| <a name="input_app_db_cidr"></a> [app\_db\_cidr](#input\_app\_db\_cidr) | database access ip ranges | `list(string)` | <pre>[<br/>  " "<br/>]</pre> | no |
| <a name="input_app_peer_cidr"></a> [app\_peer\_cidr](#input\_app\_peer\_cidr) | app peering ip ranges | `list(string)` | <pre>[<br/>  " "<br/>]</pre> | no |
| <a name="input_associate_public_ip_address"></a> [associate\_public\_ip\_address](#input\_associate\_public\_ip\_address) | enable public ip address | `bool` | `false` | no |
| <a name="input_bastion_ip"></a> [bastion\_ip](#input\_bastion\_ip) | ip of bastion host | `string` | `" "` | no |
| <a name="input_bastion_port"></a> [bastion\_port](#input\_bastion\_port) | bastion ssh port | `number` | `22` | no |
| <a name="input_bastion_private_key"></a> [bastion\_private\_key](#input\_bastion\_private\_key) | bastion ssh key | `string` | `" "` | no |
| <a name="input_bastion_username"></a> [bastion\_username](#input\_bastion\_username) | bastion host login user | `string` | `"ec2-user"` | no |
| <a name="input_create_iam_role"></a> [create\_iam\_role](#input\_create\_iam\_role) | create iam role toggle | `bool` | `false` | no |
| <a name="input_create_sg"></a> [create\_sg](#input\_create\_sg) | create security group toggle | `bool` | `false` | no |
| <a name="input_custom_policy_files"></a> [custom\_policy\_files](#input\_custom\_policy\_files) | custom policy file paths | `list(string)` | <pre>[<br/>  ""<br/>]</pre> | no |
| <a name="input_default_egress_internet"></a> [default\_egress\_internet](#input\_default\_egress\_internet) | allow internet egress traffic | `bool` | `false` | no |
| <a name="input_ec2_assume_role_policy"></a> [ec2\_assume\_role\_policy](#input\_ec2\_assume\_role\_policy) | ec2 role trust policy | `string` | `null` | no |
| <a name="input_enable_app_db_access"></a> [enable\_app\_db\_access](#input\_enable\_app\_db\_access) | enable database access rules | `bool` | `false` | no |
| <a name="input_enable_app_flask"></a> [enable\_app\_flask](#input\_enable\_app\_flask) | enable flask app access | `bool` | `false` | no |
| <a name="input_enable_app_ssh"></a> [enable\_app\_ssh](#input\_enable\_app\_ssh) | allow app ssh access | `bool` | `false` | no |
| <a name="input_enable_app_vpc_peering_eg"></a> [enable\_app\_vpc\_peering\_eg](#input\_enable\_app\_vpc\_peering\_eg) | allow app vpc egress | `bool` | `false` | no |
| <a name="input_enable_app_vpc_peering_ig"></a> [enable\_app\_vpc\_peering\_ig](#input\_enable\_app\_vpc\_peering\_ig) | allow app vpc ingress | `bool` | `false` | no |
| <a name="input_enable_bastion_ssh"></a> [enable\_bastion\_ssh](#input\_enable\_bastion\_ssh) | allow bastion ssh access | `bool` | `false` | no |
| <a name="input_enable_connect_ssh"></a> [enable\_connect\_ssh](#input\_enable\_connect\_ssh) | allow connect ssh access | `bool` | `false` | no |
| <a name="input_enable_connect_vpc_peering"></a> [enable\_connect\_vpc\_peering](#input\_enable\_connect\_vpc\_peering) | enable connect vpc peering | `bool` | `false` | no |
| <a name="input_enable_nginx_http"></a> [enable\_nginx\_http](#input\_enable\_nginx\_http) | allow nginx http access | `bool` | `false` | no |
| <a name="input_enable_nginx_ssh"></a> [enable\_nginx\_ssh](#input\_enable\_nginx\_ssh) | allow nginx ssh access | `bool` | `false` | no |
| <a name="input_enable_ssh"></a> [enable\_ssh](#input\_enable\_ssh) | enable ssh access rules | `bool` | `false` | no |
| <a name="input_instance_name"></a> [instance\_name](#input\_instance\_name) | name of ec2 instance | `string` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | size of ec2 instance | `string` | n/a | yes |
| <a name="input_key"></a> [key](#input\_key) | ssh key pair name | `string` | `" "` | no |
| <a name="input_policy_arns"></a> [policy\_arns](#input\_policy\_arns) | iam policy arn list | `list(string)` | <pre>[<br/>  ""<br/>]</pre> | no |
| <a name="input_remote_exec_cmds"></a> [remote\_exec\_cmds](#input\_remote\_exec\_cmds) | remote commands to execute | `list(string)` | <pre>[<br/>  " pwd"<br/>]</pre> | no |
| <a name="input_s3_access_policy"></a> [s3\_access\_policy](#input\_s3\_access\_policy) | s3 bucket access policy | `string` | `null` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | security group identifier value | `string` | `" "` | no |
| <a name="input_sg_ssh_cidr"></a> [sg\_ssh\_cidr](#input\_sg\_ssh\_cidr) | ssh allowed ip ranges | `list(string)` | <pre>[<br/>  " "<br/>]</pre> | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet id for instance | `string` | n/a | yes |
| <a name="input_user_data_path"></a> [user\_data\_path](#input\_user\_data\_path) | path to userdata file | `string` | `" "` | no |
| <a name="input_user_ip"></a> [user\_ip](#input\_user\_ip) | user ip address ranges | `list(string)` | <pre>[<br/>  " "<br/>]</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc id for instance | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_role_arn"></a> [iam\_role\_arn](#output\_iam\_role\_arn) | arn of the ec2 role that is created |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | ID of the EC2 instance |
| <a name="output_private_ip"></a> [private\_ip](#output\_private\_ip) | Private IP address of the EC2 instance |
| <a name="output_public_ip"></a> [public\_ip](#output\_public\_ip) | Public IP address of the EC2 instance |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | ID of the created security group (if created) |
| <a name="output_sg_id"></a> [sg\_id](#output\_sg\_id) | ID of the created security group (if created) |
| <a name="output_tls_key"></a> [tls\_key](#output\_tls\_key) | private key for the vms |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_lb.nlb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.nlb_listener](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_target_group.target_grp](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.nlb_tg_atch_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_appln_port"></a> [appln\_port](#input\_appln\_port) | application listening port number | `number` | n/a | yes |
| <a name="input_del_protection"></a> [del\_protection](#input\_del\_protection) | enable deletion protection flag | `bool` | `false` | no |
| <a name="input_enable_cross_zone_lb"></a> [enable\_cross\_zone\_lb](#input\_enable\_cross\_zone\_lb) | enable cross zone balancing | `bool` | n/a | yes |
| <a name="input_lb_internal_facing"></a> [lb\_internal\_facing](#input\_lb\_internal\_facing) | internal or internet facing | `bool` | `false` | no |
| <a name="input_lb_name"></a> [lb\_name](#input\_lb\_name) | name of the load balancer | `string` | n/a | yes |
| <a name="input_lb_type"></a> [lb\_type](#input\_lb\_type) | type of the load balancer | `string` | n/a | yes |
| <a name="input_listener_port"></a> [listener\_port](#input\_listener\_port) | port for load balancer | `number` | `80` | no |
| <a name="input_nlb_tg_name"></a> [nlb\_tg\_name](#input\_nlb\_tg\_name) | name of target group | `string` | `"nlb_tg_1"` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | protocol for load balancer | `string` | `"TCP"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | subnets for load balancer | `list(string)` | <pre>[<br/>  ""<br/>]</pre> | no |
| <a name="input_target_ids"></a> [target\_ids](#input\_target\_ids) | list of target ids | `list(string)` | <pre>[<br/>  ""<br/>]</pre> | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | type of target resource | `string` | `"instance"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc id for resources | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nlb_dns"></a> [nlb\_dns](#output\_nlb\_dns) | dns of the nlb |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.pg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_db_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_subnet_group) | resource |
| [aws_secretsmanager_secret.rds_creds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.rds_creds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [aws_security_group.db_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [random_password.pass](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allocated_storage"></a> [allocated\_storage](#input\_allocated\_storage) | database storage size | `number` | n/a | yes |
| <a name="input_db_identifier"></a> [db\_identifier](#input\_db\_identifier) | database name identifier | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | name of database | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | database login password | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | database user | `string` | n/a | yes |
| <a name="input_ingress_cidr_block"></a> [ingress\_cidr\_block](#input\_ingress\_cidr\_block) | allowed ingrss | `list(string)` | n/a | yes |
| <a name="input_instance_class"></a> [instance\_class](#input\_instance\_class) | database instance size | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | subnets for database | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc for db provision | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_subnet_group"></a> [db\_subnet\_group](#output\_db\_subnet\_group) | subnet group name |
| <a name="output_random_pass"></a> [random\_pass](#output\_random\_pass) | generated db password |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | database connection endpoint |
| <a name="output_rds_instance_id"></a> [rds\_instance\_id](#output\_rds\_instance\_id) | database instance identifier |
| <a name="output_rds_security_group_id"></a> [rds\_security\_group\_id](#output\_rds\_security\_group\_id) | database security group |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.eip-nat-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat-1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route.igw_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_route.nat_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_igw"></a> [create\_igw](#input\_create\_igw) | create internet gateway | `bool` | `false` | no |
| <a name="input_create_igw_rte"></a> [create\_igw\_rte](#input\_create\_igw\_rte) | create igw route | `bool` | `false` | no |
| <a name="input_create_nat"></a> [create\_nat](#input\_create\_nat) | create nat gateway | `bool` | `false` | no |
| <a name="input_create_nat_rte"></a> [create\_nat\_rte](#input\_create\_nat\_rte) | create nat route | `bool` | `false` | no |
| <a name="input_igw_name"></a> [igw\_name](#input\_igw\_name) | internet gateway name | `string` | `"igw"` | no |
| <a name="input_nat_name"></a> [nat\_name](#input\_nat\_name) | nat gateway name | `string` | `"nat"` | no |
| <a name="input_priv_rt_id"></a> [priv\_rt\_id](#input\_priv\_rt\_id) | private route table id | `string` | `" "` | no |
| <a name="input_pub_rt_id"></a> [pub\_rt\_id](#input\_pub\_rt\_id) | public route table id | `string` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | subnet id | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc id | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_igw_id"></a> [igw\_id](#output\_igw\_id) | IGW ID |
| <a name="output_nat_id"></a> [nat\_id](#output\_nat\_id) | NAT ID |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route.peer_rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route) | resource |
| [aws_vpc_peering_connection.peering](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_peering_connection) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acceptor_vpc_id"></a> [acceptor\_vpc\_id](#input\_acceptor\_vpc\_id) | Acceptor VPC ID | `string` | n/a | yes |
| <a name="input_requestor_vpc_id"></a> [requestor\_vpc\_id](#input\_requestor\_vpc\_id) | Requestor VPC ID | `string` | n/a | yes |
| <a name="input_rt_1"></a> [rt\_1](#input\_rt\_1) | Subnet's Route table ids | `list(string)` | n/a | yes |
| <a name="input_rt_2"></a> [rt\_2](#input\_rt\_2) | Subnet's cidr | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_peer_id"></a> [peer\_id](#output\_peer\_id) | Peer connection ID |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route_table.rt](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.subnet_association](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gateway_id"></a> [gateway\_id](#input\_gateway\_id) | Gateway ID for route table | `string` | `""` | no |
| <a name="input_rt_name"></a> [rt\_name](#input\_rt\_name) | Name for route table | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | Subnet IDs for route table | `list(string)` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_route_table_id"></a> [route\_table\_id](#output\_route\_table\_id) | The ID of the created route table |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_subnet.subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_subnet_az"></a> [subnet\_az](#input\_subnet\_az) | Subnet Availability Zone | `string` | n/a | yes |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | Subnet cidr | `string` | n/a | yes |
| <a name="input_subnet_name"></a> [subnet\_name](#input\_subnet\_name) | Subnet name | `string` | n/a | yes |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | Vpc ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_cidr"></a> [subnet\_cidr](#output\_subnet\_cidr) | subet's cidr |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | Subnet ID |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_vpc.vpcs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | VPC cidr block | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | VPC name | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_cidr_block"></a> [vpc\_cidr\_block](#output\_vpc\_cidr\_block) | Cidr for the vpc |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | The ID of the VPC |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_apigatewayv2_api.http_api](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_api) | resource |
| [aws_apigatewayv2_integration.lambda_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_integration) | resource |
| [aws_apigatewayv2_route.gtw_lamb_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_route) | resource |
| [aws_apigatewayv2_stage.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/apigatewayv2_stage) | resource |
| [aws_lambda_permission.api_gtw_permission](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_permission) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_gtw_arn"></a> [api\_gtw\_arn](#input\_api\_gtw\_arn) | api gateway arn | `string` | `""` | no |
| <a name="input_api_gtw_id"></a> [api\_gtw\_id](#input\_api\_gtw\_id) | api gateway id | `string` | `""` | no |
| <a name="input_api_gtw_name"></a> [api\_gtw\_name](#input\_api\_gtw\_name) | api gateway name | `string` | `""` | no |
| <a name="input_create_api_gtw"></a> [create\_api\_gtw](#input\_create\_api\_gtw) | create api gateway | `bool` | `false` | no |
| <a name="input_create_integration"></a> [create\_integration](#input\_create\_integration) | enable lambda integration | `bool` | `false` | no |
| <a name="input_lambda_function_name"></a> [lambda\_function\_name](#input\_lambda\_function\_name) | lambda function name | `string` | `""` | no |
| <a name="input_lambda_invoke_arn"></a> [lambda\_invoke\_arn](#input\_lambda\_invoke\_arn) | lambda function arn | `string` | `""` | no |
| <a name="input_lambda_route_key"></a> [lambda\_route\_key](#input\_lambda\_route\_key) | api route key | `string` | `""` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | api protocol type | `string` | `""` | no |
| <a name="input_stage_name"></a> [stage\_name](#input\_stage\_name) | deployment stage name | `string` | `"$default"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gateway_url"></a> [api\_gateway\_url](#output\_api\_gateway\_url) | api gateway endpoint url |
| <a name="output_api_gtw_execution_arn"></a> [api\_gtw\_execution\_arn](#output\_api\_gtw\_execution\_arn) | api execution arn |
| <a name="output_api_gtw_id"></a> [api\_gtw\_id](#output\_api\_gtw\_id) | api gateway id |
| <a name="output_delete_recipe_url"></a> [delete\_recipe\_url](#output\_delete\_recipe\_url) | delete recipe endpoint |
| <a name="output_get_recipe_by_id_url"></a> [get\_recipe\_by\_id\_url](#output\_get\_recipe\_by\_id\_url) | get single recipe endpoint |
| <a name="output_get_recipes_url"></a> [get\_recipes\_url](#output\_get\_recipes\_url) | get all recipes endpoint |
| <a name="output_post_recipe_url"></a> [post\_recipe\_url](#output\_post\_recipe\_url) | create recipe endpoint |
| <a name="output_put_recipe_url"></a> [put\_recipe\_url](#output\_put\_recipe\_url) | update recipe endpoint |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_iam_role.lambda_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.lambda_basic_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_secrets_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.lambda_vpc_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda_function](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [aws_lambda_invocation.test_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_invocation) | resource |
| [aws_lambda_layer_version.lambda_layer](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_layer_version) | resource |
| [aws_security_group.lambda_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.lambda_to_rds](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_security_group_rule.rds_from_lambda](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_create_layer"></a> [create\_layer](#input\_create\_layer) | enable layer creation | `bool` | `false` | no |
| <a name="input_create_role"></a> [create\_role](#input\_create\_role) | enable role creation | `bool` | `false` | no |
| <a name="input_create_sg"></a> [create\_sg](#input\_create\_sg) | enable sg creation | `bool` | `false` | no |
| <a name="input_db_host"></a> [db\_host](#input\_db\_host) | database hostname | `string` | n/a | yes |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | database name | `string` | n/a | yes |
| <a name="input_db_password"></a> [db\_password](#input\_db\_password) | database password value | `string` | n/a | yes |
| <a name="input_db_port"></a> [db\_port](#input\_db\_port) | database port number | `string` | n/a | yes |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | database user | `string` | n/a | yes |
| <a name="input_function_name"></a> [function\_name](#input\_function\_name) | lambda function name | `string` | `""` | no |
| <a name="input_handler"></a> [handler](#input\_handler) | lambda handler path | `string` | `""` | no |
| <a name="input_layer_arn"></a> [layer\_arn](#input\_layer\_arn) | lambda layer arn | `string` | `""` | no |
| <a name="input_layer_name"></a> [layer\_name](#input\_layer\_name) | lambda layer name | `string` | `""` | no |
| <a name="input_layer_s3_key"></a> [layer\_s3\_key](#input\_layer\_s3\_key) | layer s3 path | `string` | `""` | no |
| <a name="input_payload_file"></a> [payload\_file](#input\_payload\_file) | test payload path | `string` | n/a | yes |
| <a name="input_rds_sg"></a> [rds\_sg](#input\_rds\_sg) | rds security group | `string` | `" "` | no |
| <a name="input_role_arn"></a> [role\_arn](#input\_role\_arn) | iam role arn | `string` | `""` | no |
| <a name="input_role_name"></a> [role\_name](#input\_role\_name) | iam role name | `string` | `""` | no |
| <a name="input_run_test"></a> [run\_test](#input\_run\_test) | enable test run | `bool` | `false` | no |
| <a name="input_runtime"></a> [runtime](#input\_runtime) | lambda runtime environment | `string` | `""` | no |
| <a name="input_s3_bucket"></a> [s3\_bucket](#input\_s3\_bucket) | s3 bucket name | `string` | `""` | no |
| <a name="input_s3_key"></a> [s3\_key](#input\_s3\_key) | s3 object path | `string` | `""` | no |
| <a name="input_sg_id"></a> [sg\_id](#input\_sg\_id) | security group id | `string` | `""` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | security group name | `string` | `""` | no |
| <a name="input_subnet_1_id"></a> [subnet\_1\_id](#input\_subnet\_1\_id) | first subnet id | `string` | `" "` | no |
| <a name="input_subnet_2_id"></a> [subnet\_2\_id](#input\_subnet\_2\_id) | second subnet id | `string` | `" "` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | vpc identifier | `string` | `" "` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_delete_lambda_test_result"></a> [delete\_lambda\_test\_result](#output\_delete\_lambda\_test\_result) | delete test results |
| <a name="output_function_name"></a> [function\_name](#output\_function\_name) | name of lambda function |
| <a name="output_get_by_id_lambda_test_result"></a> [get\_by\_id\_lambda\_test\_result](#output\_get\_by\_id\_lambda\_test\_result) | get by id test |
| <a name="output_get_lambda_test_result"></a> [get\_lambda\_test\_result](#output\_get\_lambda\_test\_result) | get test results |
| <a name="output_invoke_arn"></a> [invoke\_arn](#output\_invoke\_arn) | lambda invoke arn |
| <a name="output_lambda_id"></a> [lambda\_id](#output\_lambda\_id) | lambda function id |
| <a name="output_layer_arn"></a> [layer\_arn](#output\_layer\_arn) | lambda layer arn |
| <a name="output_post_lambda_test_result"></a> [post\_lambda\_test\_result](#output\_post\_lambda\_test\_result) | post test results |
| <a name="output_put_lambda_test_result"></a> [put\_lambda\_test\_result](#output\_put\_lambda\_test\_result) | put test results |
| <a name="output_role_arn"></a> [role\_arn](#output\_role\_arn) | lambda role arn |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | lambda security group id |
<!-- END_TF_DOCS -->


<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_s3_bucket.s3](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_acl.bucket_acl](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_acl) | resource |
| [aws_s3_bucket_ownership_controls.s3_bucket_acl_ownership](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_ownership_controls) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.public_access_block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_object.object](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object) | resource |
| [aws_vpc_endpoint.s3_endpoint](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint) | resource |
| [aws_vpc_endpoint_route_table_association.s3_endpoint_route](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint_route_table_association) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_acc_id"></a> [acc\_id](#input\_acc\_id) | aws account identifier number | `string` | `" "` | no |
| <a name="input_acl"></a> [acl](#input\_acl) | access control for bucket | `string` | `"private"` | no |
| <a name="input_allowed_ip"></a> [allowed\_ip](#input\_allowed\_ip) | list of allowed ips | `list(string)` | <pre>[<br/>  " "<br/>]</pre> | no |
| <a name="input_allowed_role_arns"></a> [allowed\_role\_arns](#input\_allowed\_role\_arns) | allowed aws role arns | `list(string)` | `[]` | no |
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | name of s3 bucket | `string` | n/a | yes |
| <a name="input_create_endpoint"></a> [create\_endpoint](#input\_create\_endpoint) | create vpc endpoint flag | `bool` | `false` | no |
| <a name="input_obj_path"></a> [obj\_path](#input\_obj\_path) | path to upload object | `string` | `""` | no |
| <a name="input_policy_file"></a> [policy\_file](#input\_policy\_file) | path to policy file | `string` | `""` | no |
| <a name="input_route_table_ids"></a> [route\_table\_ids](#input\_route\_table\_ids) | list of route tables | `list(string)` | `[]` | no |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | name of aws service | `string` | `""` | no |
| <a name="input_upload_obj"></a> [upload\_obj](#input\_upload\_obj) | enable object upload flag | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | id of target vpc | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_arn"></a> [s3\_bucket\_arn](#output\_s3\_bucket\_arn) | arn for the bucket created |
| <a name="output_s3_bucket_id"></a> [s3\_bucket\_id](#output\_s3\_bucket\_id) | id for the created bucket |
| <a name="output_vpc_endpoint_id"></a> [vpc\_endpoint\_id](#output\_vpc\_endpoint\_id) | created vpc endpoint id |
<!-- END_TF_DOCS -->


