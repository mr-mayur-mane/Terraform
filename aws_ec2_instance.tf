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

