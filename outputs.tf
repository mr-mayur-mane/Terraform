output "ec2_public_ip"{
    vaule = aws_instance.my_instance[*].public_ip
}

output "ec2_public_dns"{
    vaule = aws_instance.my_instance[*].public_dns
}
