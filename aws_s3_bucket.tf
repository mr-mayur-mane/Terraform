resource "aws_s3_bucket" "mybucket"{
    
    bucket = "my-s3-bucket"

    tags ={
        Name = "My bucket"
        Description = "This is development bucket"
        Environment = "Dev"
    }

}