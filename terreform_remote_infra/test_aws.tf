resource "aws_key_pair" "my_ssh_key"{
    key_name    = "my_ssh_key"
    public_key  = file("my_ssh_Key.pub")

}

resource "aws_default_vpc" "default"{

} 

resource "aws_security_group" "my_security_group"{
    name    = "Alloe all"
    vpc_id  = aws_default_vpc.default.id
    
    ingress{
        from_port   = "0"
        to_port     = "0"
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port   = "0"
        to_port     = "0"
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0]
    }
    tags={
        Name = "Allow allow"
        Description = "Allow all traffic to flow in/out"
    }
}

resource "aws_instance" "my_instance"{
    key_name                = aws_key_pair.my_ssh_key.key_name
    vpc_security_group_ids  = ["aws_security_group.my_security_group.id"]
    ami                     = var.ec2_ami_id
    instance_type           = "t2.medium"

    root_block_device{
        volume_size = 10
        volume_type = "gp3"
    }
}

