resource "aws_s3_bucket" "my-bucket" {
  bucket = "terraform-test"
}

resource "aws_s3_bucket" "ui-bucket" {
  bucket = "my-bucket"
}

