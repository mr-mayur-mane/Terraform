resource "aws_key_pair" "ssh_key_pair"{
    key_name    = "My SSH Key"
    file        = file("ssh_key")
}
