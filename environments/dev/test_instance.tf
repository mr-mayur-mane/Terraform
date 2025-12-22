resource "aws_key_pair" "my_ssh"{
    key_name    = "my_ssh_key"
    public_key  = file("my_public_key.pub")
}

resource "aws_default_vpc" "default"{
    
}