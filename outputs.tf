output "ec2_instance_public_ip" {
  value = {
    for name, instance in aws_instance.ec2_instance :
    name => instance.public_ip
  }
}