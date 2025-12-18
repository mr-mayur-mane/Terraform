resource "aws_key_pair" "my_shh_key"{
    key_name    = "my ssh key"
    public_key  = file("my_ssh_Key.pub")

}

resource "aws_default_vpc" "default"{

} 
