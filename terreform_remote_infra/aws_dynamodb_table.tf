resource "aws_dynamodb_table" "terraform_table" {
  name           = "terraform-state-table"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }


  tags = {
    Name   = "terraform-state-table"
  }
}

resource "aws_dynamodb_table" "terraform_state_table_"{
    name         = "terraform_state_table"
    billing_mode = "PAY_PER_REQUEST"
    hash_key     =  "lock_id" 
}