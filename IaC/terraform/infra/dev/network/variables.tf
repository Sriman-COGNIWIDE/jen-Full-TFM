variable "net_a-subnet" {
  description = "Subnets in Network-A"
  type = map(object({
    subnet_cidr = string
    subnet_az   = string
    subnet_name = string
  }))
  default = {
    "subnet_a" = {
      subnet_cidr = "10.0.1.0/24"
      subnet_az   = "us-east-1a"
      subnet_name = "subnet-a"
    },
    "subnet_b" = {
      subnet_cidr = "10.0.2.0/24"
      subnet_az   = "us-east-1b"
      subnet_name = "subnet-b"
    }
  }
}

variable "net_b-subnet" {
  description = "Subnets in Network-B"
  type = map(object({
    subnet_cidr = string
    subnet_az   = string
    subnet_name = string
  }))
  default = {
    "subnet_bast" = {
      subnet_cidr = "10.1.1.0/24"
      subnet_az   = "us-east-1c"
      subnet_name = "subnet_bast"
    }
    "subnet_c" = {
      subnet_cidr = "10.1.2.0/24"
      subnet_az   = "us-east-1d"
      subnet_name = "subnet_c"
    }
    "subnet_d" = {
      subnet_cidr = "10.1.3.0/24"
      subnet_az   = "us-east-1e"
      subnet_name = "subnet_d"
    }
    "subnet_e" = {
      subnet_cidr = "10.1.4.0/24"
      subnet_az   = "us-east-1f"
      subnet_name = "subnet_e"
    }
  }
}