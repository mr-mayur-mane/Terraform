resource aws_s3_bucket my_bucket{
    bucket  = "Dev bucket"

    tags ={
        Name = Dev bucket
        Description = This is terraform dev bucket
    }
}