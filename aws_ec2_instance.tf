resource "aws_key_pair" "ssh_key"{
  key_name   = "my_ssh_key"
  public_key = file("pub_key")
}

resource "aws_default_vpc" "default_vpc"{

}
resource "aws_security_group" "security_group"{
  name        = "allow all"
  description = "Allow all incoming and outgoing traffic"
}

