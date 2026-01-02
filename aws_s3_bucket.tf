resource "aws_s3_bucket" "my_bucket"{
    bucket = "My S3 Bucket"
    tags={
        Name = "Development Bucket"
        Description = "Development Bucket"
        Environment = "DEV"
    }
}