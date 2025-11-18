resource aws_s3_bucket terraform_state{
    bucket = Terraform State bucket

    tags = {
        Name = "Terraform State bucket"
        Environment = "Prod"
    }
}