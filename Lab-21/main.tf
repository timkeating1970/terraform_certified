#----------------------------------------------------------
#  Terraform - From Zero to Certified Professional
#
# Loop Construct: for_each = toset([])
#                 for_each = {}
# Made by Denis Astahov
#----------------------------------------------------------
provider "aws" {
  region = "us-west-2"
}


resource "aws_iam_user" "user" {
  for_each = toset(var.aws_users)
  name     = each.value
}

resource "aws_instance" "my_server" {
  for_each      = toset(["Dev", "Staging", "Prod"])
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t3.micro"
  tags          = {
    Name        = "Server-${each.value}"
    Owner       = "Tim Keating"
  }
}

resource "aws_instance" "server" {
  for_each      = var.servers_settings
  ami           = each.value["ami"]
  instance_type = each.value["instance_size"]

  root_block_device {
    volume_size = each.value["root_disksize"]
    encrypted   = each.value["encrypted"]
  }

  volume_tags = {
    Name = "Disk-${each.key}"
  }
  tags = {
    Name  = "Server-${each.key}"
    Owner = "Tim Keating"
  }
}

resource "aws_instance" "bastion_server" {
  for_each      = var.create_bastion == "YES" ? toset(["bastion"]) : []
  ami           = "ami-098e42ae54c764c35"
  instance_type = "t3.micro"
  tags = {
    Name  = "Bastion Server"
    Owner = "Tim Keating"
  }
}
