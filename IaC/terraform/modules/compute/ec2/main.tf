resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "ec2_1" {
  key_name   = "${var.instance_name}-key"
  public_key = tls_private_key.example.public_key_openssh
}

resource "local_file" "ec2_1_private_key_pem" {
  content  = tls_private_key.example.private_key_pem
  filename = "C:/Users/Sriman Mayandi/OneDrive/Desktop/keys/${var.instance_name}-key.pem"
}

resource "aws_security_group" "ec2_sg" {
  count  = var.create_sg ? 1 : 0
  name   = "${var.instance_name}-sg"
  vpc_id = var.vpc_id

  dynamic "ingress" {
    for_each = var.enable_bastion_ssh ? [1] : []
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "ssh-rule"
    }
  }

  dynamic "ingress" {
    for_each = var.enable_nginx_http ? [1] : []
    content {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      cidr_blocks = var.my_ip
      description = "user-http-ngninx"
    }
  }

  dynamic "ingress" {
    for_each = var.enable_ssh ? [1] : []
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = var.sg_ssh_cidr
      description = "ssh-rule"
    }
  }

  dynamic "ingress" {
    for_each = var.enable_app_flask ? [1] : []
    content {
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      description = "flask-app-rule"
    }
  }

  dynamic "ingress" {
    for_each = var.enable_app_vpc_peering_ig ? [1] : []
    content {
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = var.app_peer_cidr
      description = "vpc-peering"
    }
  }

  dynamic "egress" {
    for_each = var.default_egress_internet ? [1] : []
    content {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "default egress-rule"
    }
  }

  dynamic "egress" {
    for_each = var.enable_app_db_access ? [1] : []
    content {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      cidr_blocks = var.app_db_cidr
      description = "connect to db"
    }
  }

  dynamic "egress" {
    for_each = var.enable_app_vpc_peering_eg ? [1] : []
    content {
      from_port   = 5000
      to_port     = 5000
      protocol    = "tcp"
      cidr_blocks = var.app_peer_cidr
      description = "vpc-peering"
    }
  }

  tags = {
    Name = "${var.instance_name}-sg"
  }
}

resource "aws_instance" "ec2_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  key_name                    = var.key_name
  iam_instance_profile        = var.create_iam_role ? aws_iam_instance_profile.ec2_s3_profile[0].name : null
  associate_public_ip_address = var.associate_public_ip_address
  vpc_security_group_ids      = var.create_sg ? [aws_security_group.ec2_sg[0].id] : [var.sg_id]
  user_data                   = var.allow_user_data == true ? file(var.user_data_path) : null

  tags = {
    Name = var.instance_name
  }
}

resource "null_resource" "ec2_prov_rmt" {
  count = var.allow_rmte_exec == true ? 1 : 0
  triggers = {
    instance_id = aws_instance.ec2_instance.id
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.example.private_key_pem
    host        = aws_instance.ec2_instance.public_ip
  }
  provisioner "remote-exec" {
    inline = var.remote_exec_cmds
  }
  depends_on = [aws_instance.ec2_instance]
}

resource "null_resource" "ec2_prov_file" {
  count = var.allow_file_prov == true ? 1 : 0
  triggers = {
    instance_id = aws_instance.ec2_instance.id
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.example.private_key_pem
    host        = aws_instance.ec2_instance.public_ip
  }
  provisioner "file" {
    source      = var.src_path
    destination = var.dest_path
  }
}

resource "null_resource" "ec2_prov_rmt_via_bastion" {
  count = var.allow_rmt_via_bastion == true && length(var.remote_exec_cmds) > 0 ? 1 : 0
  triggers = {
    instance_id = aws_instance.ec2_instance.id
    #timestamp = timestamp()
  }
  connection {
    type                = "ssh"
    user                = "ec2-user"
    bastion_host        = var.bastion_ip
    bastion_user        = var.bastion_username
    bastion_private_key = var.bastion_private_key
    bastion_port        = var.bastion_port
    private_key         = tls_private_key.example.private_key_pem
    host                = aws_instance.ec2_instance.private_ip
  }
  provisioner "remote-exec" {
    inline = var.remote_exec_cmds
  }
}

resource "null_resource" "ec2_prov_files" {
  count = var.allow_multi_file_prov == true ? 1 : 0
  triggers = {
    instance_id = aws_instance.ec2_instance.id
    # timestamp = timestamp()
  }
  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = tls_private_key.example.private_key_pem
    host        = aws_instance.ec2_instance.public_ip
  }
  provisioner "file" {
    source      = var.src_1
    destination = var.dest_1
  }
  provisioner "file" {
    source      = var.src_2
    destination = var.dest_2
  }
}

resource "aws_iam_role" "ec2_s3_access_role" {
  count = var.create_iam_role ? 1 : 0
  name  = "${var.instance_name}-s3-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy" "s3_access_policy" {
  count       = var.create_iam_role ? 1 : 0
  name        = "${var.instance_name}-s3-access-policy"
  description = "Policy for EC2 to access all S3 buckets"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "s3:*"
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3_access_attachment" {
  count      = var.create_iam_role ? 1 : 0
  policy_arn = aws_iam_policy.s3_access_policy[0].arn
  role       = aws_iam_role.ec2_s3_access_role[0].name
}

resource "aws_iam_instance_profile" "ec2_s3_profile" {
  count = var.create_iam_role ? 1 : 0
  name  = "${var.instance_name}-s3-profile"
  role  = aws_iam_role.ec2_s3_access_role[0].name
}