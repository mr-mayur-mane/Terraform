resource aws_s3_bucket terraform_state{
    bucket = terraform_state

    tag = {
        Name: "Terraform State bucket"
    }
}