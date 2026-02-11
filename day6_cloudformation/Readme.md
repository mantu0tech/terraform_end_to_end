Here’s a clean **README.md** file you can use for your project:

---

# Infrastructure as Code (IaC) – CloudFormation & CDK

## 📌 What is CloudFormation?

**AWS CloudFormation** is an **AWS-native Infrastructure as Code (IaC)** service.

It allows you to define and provision AWS infrastructure using **declarative templates** written in:

* JSON
* YAML

Instead of manually creating resources in the AWS Console, you describe *what you want*, and AWS creates it for you.

---

## 🧠 What Does “Declarative” Mean?

Declarative means:

> You describe the **desired end state**, not the step-by-step process.

Example:
You don’t say:
“Create VPC → Then create subnet → Then attach route table”

Instead, you say:
“I want a VPC with a subnet and route table”
CloudFormation figures out the order automatically.

---

# 🔑 Key Components of CloudFormation

---

## 1️⃣ Templates

A **template** is a file (YAML or JSON) that describes your AWS resources.

Example (YAML):

```yaml
Resources:
  MyBucket:
    Type: AWS::S3::Bucket
```

This template creates an S3 bucket.

Think of it like a **blueprint** of your infrastructure.

---

## 2️⃣ Stacks

A **stack** is a running instance of a template.

When you upload a template to AWS and deploy it, CloudFormation creates a **stack**.

Template → Deploy → Stack

Example:
If your template creates:

* 1 EC2
* 1 VPC
* 1 S3 bucket

All of them together form one stack.

---

## 3️⃣ Resources

**Resources** are the actual AWS services created by CloudFormation.

Examples:

* EC2 instance
* S3 bucket
* VPC
* RDS database

Example inside template:

```yaml
Resources:
  MyEC2:
    Type: AWS::EC2::Instance
```

Here, `AWS::EC2::Instance` is a resource.

---

## 4️⃣ Parameters

**Parameters** allow users to pass values into a template when creating a stack.

This makes templates reusable.

Example:

```yaml
Parameters:
  InstanceType:
    Type: String
    Default: t2.micro
```

Now you can choose a different instance type when deploying.

Instead of hardcoding:
`t2.micro`

You can pass:
`t3.medium`

---

## 5️⃣ Outputs

**Outputs** return useful information after the stack is created.

Example:

```yaml
Outputs:
  BucketName:
    Value: !Ref MyBucket
```

After deployment, AWS will show the bucket name in the output section.

Useful for:

* Sharing resource IDs
* Getting public IPs
* Exporting values to other stacks

---

steps to perform practical usingthe console 
for vpc creation 
we need vpc 
then 
subnet 
then ig 
then 
vpc gatewayattachment