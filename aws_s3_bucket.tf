resource "aws_s3_bucket" "my_bucket"{
    for_each= tomap({
        prod = {
            bucket_name = "Terraform Prod",
            environment = "prod" 
        }

        dev= {
            bucket_name = "Terraform Dev",
            environment = "dev"
        }
    })
    bucket = each.value.bucket_name
    tags={
        Name = each.value.bucket_name
        Description = "Development Bucket"
        Environment = each.value.environment
    }
}