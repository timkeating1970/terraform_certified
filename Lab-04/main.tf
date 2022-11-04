#----------------------------------------------------------
#  Terraform - From Zero to Certified Professional
#
# Build WebServer during Bootstrap with External TEMPLATE File
#
# Made by Denis Astahov
#----------------------------------------------------------

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "web" {
  ami                    = "ami-0cff7528ff583bf9a" // Amazon Linux2
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.web.id]
  user_data = templatefile("user_data.sh.tpl", { // Template File
    f_name = "Tim"
    l_name = "Keating"
    names  = ["John", "Angel", "David", "Victor", "Frank", "Melissa", "Kitana"]
  })

  tags = {
    Name  = "WebServer Built by Terraform"
    Owner = "Tim Keating"
  }
}

resource "aws_security_group" "web" {
  name        = "WebServer-SG"
  description = "Security Group for my WebServer"

  ingress {
    description = "Allow port HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow port HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow ALL ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name  = "WebServer SG by Terraform"
    Owner = "Tim Keating"
  }
}
