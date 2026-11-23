resource "aws_s3_bucket" "my-bucket" {
    bucket = "${var.env}-${var.bucket_name}"
    tags = {
        Name = "${var.env}-backup-bucket"
        Environment = var.env
    }
}
