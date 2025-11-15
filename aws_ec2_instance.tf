resource aws_key_pair ssh-key{
    key_name = "my_ssh-key"
    public_key = file("ssh-key.pub)
}

resource aws_default_vpc default{

}

resource aws_security_group my_security_group{
    name = "allow-all-on-instance"
    description = "This will allow all traffic to my instance"
    vpc_id = aws_default_vpc.default.id

    ingress{
      from_port = 0
      to_port = 22
      protocol = "tcp"
      cidr_block = ["0.0.0.0/0"]
      description = "This ssh incoming"
    }

    ingress{
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_block = ["0.0.0.0/0"]
      description = "HTTP open"
    }

    egress{
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_block = ["0.0.0.0/0"]
      description = "Outgoing traffic"

    }  

    tags = {
      name = "Allow all"
    }
}

resource aws_instance my_instance{
    key_name = aws_key_pair.ssh-key.key_name
    security_group = [aws_security_group.my_security_group.name]
    instance_type = var.aws_instance_type
    ami = var.ec2_ami_id
    
    root_block_volume{
      volume_size = var.aws_root_storage_size
      volume_type = "gp3"
    }
    tags = {
      Name = "My-ec2-instance"
    }
}

