resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "terraform-key-ec2"
  public_key = file("terraform-key-ec2.pub")
}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "Default VPC"
  }
}

resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "This will add the terraform generated security group"
  vpc_id      = aws_default_vpc.default.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH open"

  }
  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP open"
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Open to all"
  }
  tags = {
    Name = "automate-sg"
  }
}

resource "aws_instance" "ec2_instance" {
  for_each = tomap({
    support-server-001 = "t2.micro",
    support-server-002 = "t2.small"
  })
  key_name        = aws_key_pair.ssh_key_pair.key_name
  security_groups = ["default"]
  instance_type   = each.value
  ami             = var.ec2_instance_ami_id
  user_data       = file("install_nginx.sh")
  root_block_device {
    volume_size = var.env == "prod" ? 20 : var.ec2_instance_default_root_volume
    volume_type = "gp3"
  }
  tags = {
    Name        = each.key
    Description = "This is the each.key"
  }
}