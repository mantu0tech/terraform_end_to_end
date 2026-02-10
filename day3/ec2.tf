# this is for ec2 with output and variable 

resource "aws_key_pair" "my_key" {
  key_name   = "ssh_key"
  public_key = file("ssh_key.pub")

}

resource "aws_default_vpc" "default" {
  tags = {
    Name = "default_vpc"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "auto-sg"
  description = "this is my sg"
  vpc_id      = aws_default_vpc.default.id
  #insterpollation here we can extract the value from the code

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_instance" "my_server" {
  key_name        = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_sg.name]
  instance_type   = "t2.micro"
  ami             = "ami-0532be01f26a3de55" #image id from the aws console

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }
  tags = {
    Name = "demo_server"
  }

}