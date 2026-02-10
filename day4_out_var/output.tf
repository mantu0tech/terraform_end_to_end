output "ec2_public_ip" {
    value = aws_instance.my_server[*].public_ip
}

output "ec2_public_dns" {
    value = aws_instance.my_server[*].public_dns
}

output "sg_id" {
    value = aws_security_group.my_sg.id
}