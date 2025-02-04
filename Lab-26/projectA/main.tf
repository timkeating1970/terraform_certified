#-------------------------------------------------------------------------------
#  Terraform - From Zero to Certified Professional
#
# Provision VPCs using Modules
#
# Made by Denis Astahov
#-------------------------------------------------------------------------------
provider "aws" {
  region = "us-east-1"
}


module "my_vpc_default" {
  source = "../modules/aws_network"
}

module "my_vpc_staging" {
  source               = "../modules/aws_network"
  env                  = "staging"
  vpc_cidr             = "10.100.0.0/16"
  public_subnet_cidrs  = ["10.100.1.0/24", "10.100.2.0/24"]
  private_subnet_cidrs = []
  tags = {
    Owner   = "KEATING.NET"
    Code    = "12345"
    Project = "Unicorn Project"
  }
}

module "my_vpc_prod" {
  source               = "../modules/aws_network"
  env                  = "prod"
  vpc_cidr             = "10.200.0.0/16"
  public_subnet_cidrs  = ["10.200.1.0/24", "10.200.2.0/24"]
  private_subnet_cidrs = ["10.200.11.0/24", "10.200.22.0/24"]
  tags = {
    Owner   = "KEATING.NET"
    Code    = "777766"
    Project = "SuperProject"
  }
}
