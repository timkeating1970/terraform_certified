variable "aws_users" {
  description = "List of IAM Users to create"
  default = [
    "denis@astahov.net",
    "krisa@astahov.net",
    "kevin@astahov.net",
    "jessy@astahov.net",
    "robby@astahov.net",
    "laura@astahov.net",
    "katie@astahov.net",
    "josef@astahov.net"
  ]
}

variable "servers_settings" {
  type = map(any)
  default = {
    web = {
      ami           = "ami-098e42ae54c764c35"
      instance_size = "t3.small"
      root_disksize = 20
      encrypted     = true
    }
    app = {
      ami           = "ami-0d70546e43a941d70"
      instance_size = "t3.micro"
      root_disksize = 10
      encrypted     = false
    }
  }
}


variable "create_bastion" {
  description = "Provision Bastion Server YES/NO"
  default     = "YES"
}
