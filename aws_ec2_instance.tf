resource "aws_key_pair" "ssh_key"{
  key_name   = "my_ssh_key"
  public_key = file("./files/pub_key")
}

resource "aws_default_vpc" "default_vpc"{

}
resource "aws_security_group" "security_group"{
  name        = "allow all"
  description = "Allow all incoming and outgoing traffic"
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"]

  }
  egress{
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags={
    Name  = "Allow all"
    Description = "Allow all traffic to flow in/out"
  }
}

resource "aws_instance" "my_instance"{
  key_name       = aws_key_pair.ssh_key.key_name
  vpc_security_group_ids = [aws_security_group.security_group]
  ami            =  var.ec2_ami_id
  instance_type  = "t2.micro"

  root_block_device{
    volume_size  = 10
    volume_type  = "gp3"
  }

}

