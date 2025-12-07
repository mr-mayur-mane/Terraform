resource aws_key_pair my_key{
  key_name   = my_ssh_key
  public_key = file("pub_key")
}

resource aws_default_vpc default{

}

resource aws_security_group my_security_group{
    name        = "allow all"
    description = "Allow all incoming and outgoing network traffic"

    ingress{
      from_port = 0
      to_port   = 0 
      protocol  = -1
    }

    egress{
      from_port = 0
      to_port   = 0
      protocol  = -1
    }

    tags{
      Name = Allow all traffic
    }

}

resource aws_instance my_instance{
  for_each = tomap{
    my_instance_1 = "t2.micro",
    my_instance_2 = "t2.medium"
  }
  key_name        = aws_key_pair.my_key.key_name
  security_group  = aws_security_group.my_security_group
  depends_on      = [aws_security_group.my_security_group, aws_key_pair.my_key.my_ssh_key]
  ami             = var.ec2_ami_id
  instance_type   = each.value

  root_block_storage{
    for_each = tomap{
      my_instance_1 = "10",
      my_instance_2 = "20"
    }
    volume_size = each.value
    volume_type = "gp3"   
  }
  tags ={
    Name = Dev instances
    Description = This is dev ec2 instances
  }

}
