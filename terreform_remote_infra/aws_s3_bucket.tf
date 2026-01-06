resource "aws_s3_bucket" "terraform_state"{
    for_each = map{
        prod={
            bucket_name = "Terraform dev bucket"
            environment = "dev"
        }

        dev = {
            bucket_name = "Terraform prod bucket"           
            environment = "prod"
        }
    }

    bucket = each.value.bucket_name

    tags={
        Name = each.value.bucket_name

        Environment = each.value.environment
    }
}