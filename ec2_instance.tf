resource "aws_key_pair" "ssh_key_pair" {
  key_name   = "terraform-key-ec2"
  public_key = file("terraform-key-ec2.pem")
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
    protocol    = "http"
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
  key_name       = aws_key_pair.ssh_key_pair.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type  = "t2.micro"
  ami            = "ami-0cb91c7de36eed2cb"
  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }
  tags = {
    Name        = "support-server-001"
    Description = "This is the support-server-001"
  }
}