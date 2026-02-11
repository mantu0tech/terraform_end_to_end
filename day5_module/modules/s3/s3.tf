#this is s3 bucket 

resource aws_s3_bucket my_buck {
    bucket = var.buck_name
    region = "us-east-1"
    force_destroy = var.fource #to delete the bucket with data
}