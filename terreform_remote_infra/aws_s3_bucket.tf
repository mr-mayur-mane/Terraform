resource aws_s3_bucket terraform_state{
    bucket = Terraform State bucket

    tag = {
        Name: "Terraform State bucket"
    }
}