resource aws_key_pair ssh_key{
    key_name   = my_ssh_key
    public_key = file("ssh-key.pub")
}

resource aws_default_vpc default{

}
resource aws_security_group allow_all{
    name        = "allow all"
    description = 'Allow all traffic'
    vpc_id      = aws_default_vpc.default.id
  
  ingress{
    from_port   = 0
    to_port     = 0
    protocol    = -1
     
  }
  egress{
    from_port = 0
    to_port   = 0
    protocol  = -1
  }

  tags = {
    Name = Allow all traffic
  }

}

resource aws_instance my_instance{
  for_each = tomap({
    my_instance_1   = "t2.micro",
    my_instance_2   = "t2.medium"
  })
  key_name          = aws_key_pair.ssh_key.key_name
  depends_on        = [aws_security_group.allow_all, aws_key_pair.ssh_key]
  security_group    = aws_security_group.allow_all.name
  ami               = var.ec2_ami_id
  user_data         = file("install_nginx.sh")
  instance_type     = each.value

  root_block_volume{
    foreach = tomap({
      my_instance_1 = "10"
      my_instance_2 = "20"
    })
    volume_size = each.value
    volume_type = "gp3
  }
}

