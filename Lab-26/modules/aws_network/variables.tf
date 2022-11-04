variable "env" {
  default = "dev"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "public_subnet_cidrs" {
  default = [
    "10.1.1.0/24",
    "10.1.2.0/24",
  ]
}

variable "private_subnet_cidrs" {
  default = [
    "10.1.11.0/24",
    "10.1.22.0/24",
  ]
}

variable "tags" {
  default = {
    Owner   = "Tim Keating"
    Project = "Phoenix"
  }
}
