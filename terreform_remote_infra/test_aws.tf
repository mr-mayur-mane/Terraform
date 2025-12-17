resource "aws_key_pair" "ssh_key_pair"{
    key_name    = "My SSH Key"
    file        = file("ssh_key")
}

resource "aws_default_vpc" "default_vpc"{

}

resource "aws_security_group" "my_security_group"{
    name        = "Allow all"
    description = "Allow all traffic"
    vpc_id      = aws_default_vpc.default_vpc.id

    ingress{
        from_port = "0"
        to_port   = "0"
        protocol  = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress{
        from_port   = "0"
        to_port     = "0"
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}
