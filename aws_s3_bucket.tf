resource "aws_s3_bucket" "my_bucket"{
    for_each= tomap({
        prod = 
    })
    bucket = "My S3 Bucket"
    tags={
        Name = "Development Bucket"
        Description = "Development Bucket"
        Environment = "DEV"
    }
}