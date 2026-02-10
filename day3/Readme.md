---

# Terraform AWS Server Setup – Theory Overview

This project focuses on creating an AWS server infrastructure using **Terraform**. The goal is to provision all required AWS resources step by step and enable secure SSH access to an EC2 instance.

All resources and configurations referenced in this project are based on official **AWS** and **Terraform** documentation.

---

## Components Required for the Server

To create an EC2 server on AWS, the following components are required:

### 1. Key Pair

A **key pair** is used for secure SSH access to the EC2 instance.

* It consists of a **public key** and a **private key**
* The public key is stored in AWS
* The private key is stored securely on your local machine
* SSH access to the EC2 instance is not possible without this key

The key pair can be generated using `ssh-keygen`, which creates both public and private keys.
The public key is then uploaded to AWS (or referenced in Terraform).

Terraform resource reference:
[https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)

---

### 2. Virtual Private Cloud (VPC)

A **VPC** is a logically isolated network in AWS where all resources run.

* Defines the IP address range
* Controls networking for EC2 instances
* Provides isolation and security
* Required for launching EC2 instances

Within the VPC, subnets, route tables, and internet gateways are typically configured.

---

### 3. Security Group (SG)

A **Security Group** acts as a virtual firewall for the EC2 instance.

* Controls inbound traffic (e.g., SSH on port 22)
* Controls outbound traffic
* Rules are stateful
* Essential for allowing SSH access from your IP

Without proper security group rules, you will not be able to connect to the server.

---

### 4. EC2 Instance

The **EC2 instance** is the actual server.

Key elements involved:

* Instance type (CPU, memory, etc.)
* Amazon Machine Image (AMI)
* Attached key pair
* Associated security group
* Launched inside a VPC subnet

---

### 5. Amazon Machine Image (AMI)

An **AMI** defines the operating system and base configuration for the EC2 instance.

* Example: Amazon Linux
* Determines default user (e.g., `ec2-user`)
* Required to launch the instance

---

## SSH Key Generation

To connect to the EC2 instance securely:

* SSH keys are generated using `ssh-keygen`
* This creates:

  * A **private key** (stored locally)
  * A **public key** (used by AWS)

The private key must be protected and never shared.

---

## Connecting to the Server

Once the EC2 instance is running and all configurations are correct, you can connect to the server using SSH.

The connection requires:

* The private key file (`.pem`)
* The EC2 public DNS name
* The correct user (e.g., `ec2-user`)

Successful connection confirms that:

* The key pair is valid
* Security group allows SSH
* Instance is running correctly

---

## Documentation Reference

All resources and configurations are based on official Terraform AWS provider documentation:

[https://registry.terraform.io/providers/hashicorp/aws/latest/docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)

---

## Summary

This project demonstrates how to:

* Create a secure AWS server using Terraform
* Generate and manage SSH keys
* Configure networking and security
* Launch and access an EC2 instance

Infrastructure is fully reproducible, scalable, and managed as code using Terraform.

---

