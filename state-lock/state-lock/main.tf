resource "aws_instance" "server" {
    ami = "ami-0236922087fa98b6e"
    instance_type = "t3.micro"
    tags  = {
        Name = "Server"
    }
}

terraform {
    backend "s3" {
        bucket = "s3-state-file-for-my-infra2345"
        key = "terrafrom.tfstate"
        dynamodb_table = "my-db"
        region = "us-east-1"
}
}
