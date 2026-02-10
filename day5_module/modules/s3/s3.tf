#this is s3 bucket 

resource aws_s3_bucket my_buck {
    bucket = "my-buck-demo-s3"
    region = "us-east-1"
    force_destroy = true #to delete the bucket with data
}