resource "aws_dynamodb_table" "terraform_state_table_"{
    name         = "terraform_state_table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     =  "lock_id" 

    attribute{
      name = "lock_id"
      type = "S"
    }

    tags={
      Name = "Terraform state table"
      Description = "Terreform state table to access the state file once per request"
    }
}