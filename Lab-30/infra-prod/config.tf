terraform {
  backend "s3" {
    bucket = "adv-it-terraform-remote-state-756028263501" // Bucket where to SAVE Terraform State
    key    = "infra-prod/terraform.tfstate"   // Object name in the bucket to SAVE Terraform State
    region = "us-east-1"                     // Region where bucket is created
  }
}
