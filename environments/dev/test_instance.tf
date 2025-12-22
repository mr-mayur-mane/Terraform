resource "aws_key_pair" "my_ssh"{
    key_name    = "my_ssh_key"
    public_key  = file("my_public_key.pub")
}

resource "aws_default_vpc" "default"{

}

resource "aws_security_group" "my_security_group"{
    name   = "my_security_group"
    vpc_id = aws_default_vpc.default.id
}