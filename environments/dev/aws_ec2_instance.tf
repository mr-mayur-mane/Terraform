resource "aws_key_pair" "my_key"{
  key_name   = "my_ssh_key"
  public_key = file("pub_key")
}

resource "aws_default_vpc" "default"{

}

resource "aws_security_group" "my_security_group"{
    name        = "allow all"
    description = "Allow all incoming and outgoing network traffic"

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
      Name = "Allow all traffic"
    }

}

resource "aws_instance" "my_instance"{
  for_each = tomap({
    my_instance_1 = "t2.micro",
    my_instance_2 = "t2.medium"
  })
  key_name        = aws_key_pair.my_key.key_name
  vpc_security_group_ids  = [aws_security_group.my_security_group.id]
  depends_on      = [aws_security_group.my_security_group, aws_key_pair.my_key.my_ssh_key]
  ami             = var.ec2_ami_id
  instance_type   = each.value

  root_block_devive{    
    volume_size = 20
    volume_type = "gp3"   
  }

  tags ={
    Name = "Dev instances"
    Description = "This is dev ec2 instances"
  }

}
