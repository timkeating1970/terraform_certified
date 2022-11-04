aws_region    = "us-east-1"
port_list     = ["80", "443", "8443"]
instance_size = "t3.micro"
key_pair      = "tfkey"

tags = {
  Owner       = "Tim Keating"
  Environment = "Staging"
  Project     = "Phoenix"
  Code        = "445555"
}
