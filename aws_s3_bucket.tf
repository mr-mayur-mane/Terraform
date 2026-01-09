resource "aws_s3_bucket" "my_bucket"{
    for_each= {
        prod = {
            bucket_name = "Terraform Prod"
            environment = "prod" 
            description = "This is terraform prod bucket"
        }
        dev= {
            bucket_name = "Terraform Dev"
            environment = "dev"
            description = "This is terraform dev bucket"
        }
    }
    bucket = each.value.bucket_name
    tags={
        Name = each.value.bucket_name
        Description = each.value.description
        Environment = each.value.environment
    }
}

# terraform init