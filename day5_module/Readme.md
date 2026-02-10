Here’s a complete **README.md** you can use for your Terraform project that will **use modules to create a VPC, an EC2 instance, and an S3 bucket**, including a simple explanation of what a module is and how to use the inventory Terraform Registry modules you mentioned. ([GitHub][1])

---

# 📦 Terraform Infrastructure — VPC + EC2 + S3 Using Modules

## 🧠 What Is a *Module* in Terraform?

In **simple words**, a *module* in Terraform is a **reusable package of Terraform configuration**.
It lets you group related resources and then call that group from other configs so you don’t repeat the same code again and again. ([Glen Thomas][2])

There are two types of modules:

1. **Root module** — the top-level code you run with `terraform apply`.
2. **Child modules** — reusable modules you call from the root using a `module` block.
   These can be:

   * Local folders
   * Modules from the **Terraform Registry** (like networking or compute modules) ([HashiCorp Developer][3])

---

## 🔗 Modules We Are Using

| Module               | Source (Registry)                                      |
| -------------------- | ------------------------------------------------------ |
| **VPC (networking)** | `terraform-aws-modules/vpc/aws` ([GitHub][1])          |
| **EC2 Instance**     | `terraform-aws-modules/ec2-instance/aws` ([GitHub][4]) |
| **S3 Bucket**        | `terraform-aws-modules/s3-bucket/aws` ([GitHub][5])    |

---

## 🗂 Project Structure

```
terraform/
├── main.tf
├── variables.tf
├── outputs.tf
├── provider.tf
├── terraform.tfvars
├── README.md   <-- (this file)
```

---

## ⚙️ provider.tf

Configure the AWS provider:

```hcl
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}
```

---

## 📌 variables.tf

Define input variables used by the modules:

```hcl
variable "aws_region" {
  description = "AWS Region to deploy into"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "Public subnet CIDRs"
  type        = list(string)
}

variable "private_subnets" {
  description = "Private subnet CIDRs"
  type        = list(string)
}

variable "ec2_ami" {
  description = "AMI ID for EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}
```

---

## 🧱 main.tf — Using the Modules

### ✅ 1) VPC Module

```hcl
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.0.0"  # pin a version

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

---

### ✅ 2) EC2 Module

```hcl
module "ec2" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "4.0.0"

  name           = "example-ec2"
  instance_type  = var.ec2_instance_type
  ami            = var.ec2_ami

  subnet_id                = module.vpc.public_subnets[0]
  vpc_security_group_ids   = [module.vpc.default_security_group_id]

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
```

> This will create a single EC2 in the first public subnet provided by the VPC module. ([HashiCorp Developer][3])

---

### ✅ 3) S3 Bucket Module

```hcl
module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.0.0"

  bucket = var.s3_bucket_name

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
```

---

## 📤 outputs.tf

Example outputs you might want:

```hcl
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "ec2_public_ip" {
  value = module.ec2.public_ip
}

output "s3_bucket_arn" {
  value = module.s3_bucket.s3_bucket_arn
}
```

---

## 📥 terraform.tfvars

Provide values for your variables:

```hcl
aws_region           = "us-east-1"
vpc_name             = "demo-vpc"
vpc_cidr             = "10.0.0.0/16"
public_subnets       = ["10.0.1.0/24","10.0.2.0/24","10.0.3.0/24"]
private_subnets      = ["10.0.101.0/24","10.0.102.0/24","10.0.103.0/24"]
ec2_ami              = "ami-0c94855ba95c71c99"
ec2_instance_type    = "t3.micro"
s3_bucket_name       = "my-unique-bucket-12345"
```

---

## 🚀 Deploying

From the root folder:

```bash
terraform init
terraform plan
terraform apply
```

---

## 🤔 Why Use Modules?

* Write less code ✂️
* Reuse infrastructure patterns 📦
* Avoid errors by using well-tested building blocks 🌟
* Use Terraform Registry modules instantly without reinventing the wheel 🚀 ([Glen Thomas][2])

---


[1]: https://github.com/terraform-aws-modules/terraform-aws-vpc?utm_source=chatgpt.com "GitHub - terraform-aws-modules/terraform-aws-vpc: Terraform module to create AWS VPC resources 🇺🇦"
[2]: https://blog.glen-thomas.com/platform%20engineering/2022/04/04/terraform-modules.html?utm_source=chatgpt.com "Making use of Terraform modules - Glen Thomas"
[3]: https://developer.hashicorp.com/terraform/tutorials/modules/module-use?utm_source=chatgpt.com "Use registry modules in configuration | Terraform | HashiCorp Developer"
[4]: https://github.com/terraform-aws-modules/terraform-aws-ec2-instance?utm_source=chatgpt.com "GitHub - terraform-aws-modules/terraform-aws-ec2-instance: Terraform module to create AWS EC2 instance(s) resources 🇺🇦"
[5]: https://github.com/terraform-aws-modules/terraform-aws-s3-bucket?utm_source=chatgpt.com "GitHub - terraform-aws-modules/terraform-aws-s3-bucket: Terraform module to create AWS S3 resources 🇺🇦"
