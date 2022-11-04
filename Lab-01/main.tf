#----------------------------------------------------------
#  Terraform - From Zero to Certified Professional
#
# Build EC2 Instances
#
# Made by Denis Astahov
#----------------------------------------------------------

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "my_ubuntu" {
  ami           = "ami-052efd3df9dad4825" # This is Comments
  instance_type = "t3.micro"              // This is also Comments
  key_name      = "tfkey"

  tags = {
    Name    = "My-UbuntuLinux-Server"
    Owner   = "Tim Keating"
    project = "Phoenix"
  }
}

resource "aws_instance" "my_amazon" {
  ami           = "ami-05fa00d4c63e32376" // This is Comments
  instance_type = "t3.micro"              # This is also Comments
  key_name      = "tfkey"

  tags = {
    Name    = "My-AmazonLinux2-Server"
    Owner   = "Tim Keating"
    project = "Phoenix"
  }
}
