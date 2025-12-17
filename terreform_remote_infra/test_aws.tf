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
    tags={
        Name    = "Allow all"
        Description = "Allow all traffic to pass"
    }
}

resource "aws_instance" "my_instance"{
    key_name =  aws_key_pair.ssh_key_pair.key_name
    vpc_security_group_ids   = ["aws_security_group.my_security_group.vpc_id"] 
    ami                      = var.ec2_ami_id
    instance_type            = "t2.medium"
}
