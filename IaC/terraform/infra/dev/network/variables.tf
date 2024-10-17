variable "net_a-subnet" {
  type = map(object({
    subnet_cidr = string
    subnet_az   = string
    vpc_id      = string
    subnet_name = string
  }))
  default = {
    "subnet_a" = {
      subnet_cidr = "10.0.1.0/24"
      subnet_az   = "us-east-1a"
      vpc_id      = ""
      subnet_name = "subnet-a"
    },
    "subnet_b" = {
      subnet_cidr = "10.0.2.0/24"
      subnet_az   = "us-east-1b"
      vpc_id      = ""
      subnet_name = "subnet-b"
    }
  }
}

variable "net_b-subnet" {
  type = map(object({
    subnet_cidr = string
    subnet_az   = string
    vpc_id      = string
    subnet_name = string
  }))
  default = {
    "subnet_bast" = {
      subnet_cidr = "10.1.1.0/24"
      subnet_az   = "us-east-1c"
      vpc_id      = ""
      subnet_name = "subnet_bast"
    }
    "subnet_c" = {
      subnet_cidr = "10.1.2.0/24"
      subnet_az   = "us-east-1c"
      vpc_id      = ""
      subnet_name = "subnet_c"
    }
    "subnet_d" = {
      subnet_cidr = "10.1.3.0/24"
      subnet_az   = "us-east-1d"
      vpc_id      = ""
      subnet_name = "subnet_d"
    }
    "subnet_e" = {
      subnet_cidr = "10.1.4.0/24"
      subnet_az   = "us-east-1e"
      vpc_id      = ""
      subnet_name = "subnet_e"
    }
  }
}