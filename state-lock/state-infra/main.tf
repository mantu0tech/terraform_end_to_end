resource "aws_s3_bucket" "s3" {
  bucket = "s3-state-file-for-my-infra2345"
  force_destroy = true
}

resource "aws_dynamodb_table" "db" {
    name = "my-db"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute {
        name = "LockID"
        type = "S"
    }
  
}