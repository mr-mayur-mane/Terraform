resource "aws_key_pair" "my_shh_key"{
    key_name    = "my ssh key"
    public_key  = file("my_ssh_Key.pub")

}

resource "aws_default_vpc" "default"{

} 

resource "aws_security_group" "my_security_group"{
    name    = "Alloe all"
    vpc_id  = aws_default_vpc.default.id
    
    igress{
        from_port   = "0"
        to_port     = "0"
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port   = "0"
        to_port     = "0"
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0]
    }
}
