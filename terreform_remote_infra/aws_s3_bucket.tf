# resource "aws_s3_bucket" "terraform_state"{
#     for_each = {
#         prod = {
#             bucket_name = "Terraform dev bucket"
#             environment = "dev"
#         }

#         dev = {
#             bucket_name = "Terraform prod bucket"           
#             environment = "prod"
#         }
#     }

#     bucket = each.value.bucket_name

#     tags={
#         Name = each.value.bucket_name

#         Environment = each.value.environment
#     }
# }

resource "aws_s3_bucket" "my-bucket"{
    bucket= "my-test-bucket"

    tags={
        Name = "test"
        Description = "this is the test bucket"
    }

}