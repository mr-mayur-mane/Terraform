resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state"
  tags = {
    Name        = "terraform-state-file"
    Description = "This is the terraform remote state file"
  }
}

resource "aws_s3_bucket" "ui-bucket" {
  bucket = "my-bucket"
}

