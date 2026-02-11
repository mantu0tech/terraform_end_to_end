output "buck_name" {
    value = module.s3.buck_arn
}

output "buck_arn" {
    value = module.s3.buck_name
}

output "ec_ip" {
    value = module.ec2.ec2_public_ip
}

output "ec2_ip" {
    value = module.ec2.ec2_public_dns
}