resource "aws_key_pair" "ssh_key"{
  key_name   = "my_ssh_key"
  public_key = file("pub_key")
}

resource "aws_default_vpc" "default_vpc"{

}
resource "aws_security_group" "security_group"{
  name        = "allow all"
  description = "Allow all incoming and outgoing traffic"
  vpn_id      = aws_default_vpc.default_vpc.id

  ingress{
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_block  = ["0.0.0.0/0"]

  }
  egress{
    from_port  = 0
    to_port    = 0
    protocol   = "-1"
    cidr_block = ["0.0.0.0/0"]

  }
  tags={
    Name  = "Allow all"
  }
}

