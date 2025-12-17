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
    for_each = tomap({
        instance1 = "t2.micro",
        instance2 = "t2.medium"

    })
    key_name =  aws_key_pair.ssh_key_pair.key_name
    vpc_security_group_ids   = [aws_security_group.my_security_group.id] 
    depends_on               = [aws_security_group.my_security_group.id]
    ami                      = var.ec2_ami_id
    instance_type            = each.value

    root_block_device{
        for_each = tomap({
            instance1 = "gp2",
            instance2 = "gp3"
        })
        volume_size = 10
        volume_type = each.name
    }
}
