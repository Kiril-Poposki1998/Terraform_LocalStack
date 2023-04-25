resource "aws_dynamodb_table" "terraform_state_lock" {
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "TestTableHashKey"
  name         = "terraform_state_lock"


  attribute {
    name = "TestTableHashKey"
    type = "S"
  }
}

resource "aws_db_instance" "SQL_DB" {
  allocated_storage    = 10
  db_name              = "dev_db"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_subnet.db_sub
}

resource "aws_db_snapshot" "dev_snapshot" {
  db_instance_identifier = aws_db_instance.SQL_DB.id
  db_snapshot_identifier = "dev_snapshot"
}