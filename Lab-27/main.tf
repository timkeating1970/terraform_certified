#-------------------------------------------------------------------------------
#  Terraform - From Zero to Certified Professional
#
# Re-Create Resource in Terraform up to v0.15.1
#    1. terraform init
#    2. terraform taint aws_instance.node2
#    3. terraform plan
#    4. terraform apply
# Made by Denis Astahov
#-------------------------------------------------------------------------------

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "node1" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t3.micro"
  tags = {
    Name  = "Node-1"
    Owner = "Tim Keating"
  }
}

resource "aws_instance" "node2" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t3.micro"
  tags = {
    Name  = "Node-2"
    Owner = "Tim Keating"
  }
}

resource "aws_instance" "node3" {
  ami           = "ami-0cff7528ff583bf9a"
  instance_type = "t3.micro"
  tags = {
    Name  = "Node-3"
    Owner = "Tim Keating"
  }
  depends_on = [aws_instance.node2]
}
