---

## Variables in Terraform

### What is a Variable?

A **variable** in Terraform is a way to store a value that can be reused throughout the configuration.
Instead of hard-coding values (like instance type, region, or AMI ID), variables allow you to define values in one place and reference them wherever needed.

---

### Why Do We Need Variables?

Variables are used to:

* Make Terraform configurations **reusable**
* Avoid repeating the same value multiple times
* Easily change values without modifying main configuration files
* Improve readability and maintainability
* Support different environments (dev, test, prod)

Using variables helps follow **Infrastructure as Code best practices**.

---

### Syntax of a Variable

A variable in Terraform is defined using a variable block.
Each variable has:

* A name
* A data type
* An optional default value
* An optional description

---

### Variable Data Types

Terraform supports multiple variable types. The most commonly used ones are:

#### String

* Used for text values
* Examples: region name, AMI ID, instance type

#### Number

* Used for numeric values
* Examples: instance count, port numbers

#### Boolean

* Used for true or false values
* Examples: enable or disable features

---

### How to Use Variables

Once a variable is defined, it can be referenced inside Terraform resources.

Variables can get values from:

* Default values
* Command line input
* Variable files
* Environment variables

This allows flexible configuration without changing core Terraform files.

---

## Outputs in Terraform

### What is an Output?

An **output** is a way to display specific values after Terraform applies the configuration.

Outputs are commonly used to:

* Show important information
* Share resource details with users or other modules

---

### Why Do We Use Outputs?

Outputs are used to:

* Display values like public IP, DNS name, or instance ID
* Help users connect to resources (e.g., SSH details)
* Pass information between Terraform modules
* Improve visibility of created infrastructure

---

### Syntax of Output

An output is defined using an output block.
Each output includes:

* A name
* A value to display
* An optional description

---

### How to Use Output

After running Terraform apply:

* Output values are displayed in the terminal
* They can be referenced by other Terraform modules
* They help verify that resources were created successfully

Outputs are especially useful for accessing connection details such as EC2 public IP or DNS name.

---

## Summary

* **Variables** make Terraform flexible and reusable
* **Outputs** help expose important information
* Together, they improve clarity, maintainability, and usability of Terraform projects

User Data in Terraform
What is User Data?

User data is a script or set of commands that runs automatically when an EC2 instance starts for the first time.

It is mainly used for:

Installing packages

Updating the system

Starting services

Running initialization scripts

User data helps automate server setup without manually logging in.

Count in Terraform (Launching Multiple Instances)
What is Count?

Count is a Terraform meta-argument used to create multiple instances of the same resource.

Instead of writing the same resource multiple times, count allows Terraform to loop and create several identical resources.
---
