resource aws_s3_bucket terraform_state{
    for_each = tomap({
        my_bucket_prod = "Terraform State bucket Prod",
        my_bucket_dev = "Terraform State bucket Dev"
    })
    bucket = each.value

    tags = {
        for_each = tomap({
            my_bucket_prod = "Production terraform State bucket",
            my_bucket_dev = "Development terraform state bucket"
        })
        Name = each.value
        Environment = "Prod"
    }
}