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
  key_name        = aws_key_pair.my_key.key_name
  security_group  = aws_security_group.my_security_group
  depends_on      = [aws_security_group.my_security_group, aws_key_pair.my_key.my_ssh_key]
  ami             = var.ec2_ami_id
  instance_type   = "t2.micro"

  root_block_storage{
    volume_size = "10"
    volume_type = "gp3"   
  }



}
