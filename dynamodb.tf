resource "aws_dynamodb_table" "terraform_state_lock" {
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "TestTableHashKey"
  name         = "terraform_state_lock"


  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
}