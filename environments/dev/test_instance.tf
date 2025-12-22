resource "aws_key_pair" "my_ssh"{
    key_name    = "my_ssh_key"
    public_key  = file("my_public_key.pub")
}

resource "aws_default_vpc" "default"{

}

resource "aws_security_group" "my_security_group"{
    name   = "my_security_group"
    vpc_id = aws_default_vpc.default.id

    ingress{
        from_port = 0
        to_port   = 0
        protocol  = "-1"
        cidr_blocks = ["0.0.0.0/0"] 
    }

    egress{
        from_port = 0
        to_port   = 0 
        protocol  = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags={
        Name = "Allow all"
        Description = "Allow allow traffic"
    }
}

resource "aws_instance" "my_instance"{
    key_name = aws_key_pair.my_ssh.key_name
    vpc_security_group_ids = [aws_security_group.my_security_group]
    instance_key  = "t2.micro"
    ami = var.ec2_ami_id


    root_block_device{
        volume_size = 10
        volume_type = "gp3"
    }
}