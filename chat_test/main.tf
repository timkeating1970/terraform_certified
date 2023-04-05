# Provider Configuration
provider "aws" {
  region = "us-east-1"
}

# Create Security Group
resource "aws_security_group" "tk_sg" {
  name_prefix = "TK-SG"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch EC2 Instances
resource "aws_instance" "ec2_instances" {
  count           = 2
  ami             = "ami-0c94855ba95c71c99" # Amazon Linux 2 AMI
  instance_type   = "t2.micro"
  key_name        = "tkkey"
  security_groups = [aws_security_group.tk_sg.name]
  tags = {
    Name        = "Server ${count.index + 1}"
    Environment = "Production"
  }
}

# Output Public IPs of EC2 Instances
output "public_ips" {
  value = aws_instance.ec2_instances.*.public_ip
}
