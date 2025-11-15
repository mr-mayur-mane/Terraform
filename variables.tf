variable "aws_instance_type"{
    default = "t2.micro"
    type = string
}

variable "aws_root_storage_size"{
    default = 15
    type = number
} 

variable "ec2_ami_id"{
    default = "ami-0cb91c7de36eed2cb"
    type = string
}