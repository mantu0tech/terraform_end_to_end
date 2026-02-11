# 🚀 What is AWS CDK?

**AWS CDK (Cloud Development Kit)** is a tool that allows you to define AWS infrastructure using programming languages instead of writing YAML/JSON.

You can use:

* TypeScript
* Python
* Java
* C#

---

## 💡 How CDK Works

1. You write infrastructure using code (like Python or TypeScript).
2. CDK converts that code into a CloudFormation template.
3. CloudFormation deploys it.

So basically:

CDK Code → Generates CloudFormation → Deploys Stack

---

## 🧾 Example (Python CDK)

```python
from aws_cdk import (
    aws_s3 as s3,
    Stack
)
from constructs import Construct

class MyStack(Stack):
    def __init__(self, scope: Construct, id: str, **kwargs):
        super().__init__(scope, id, **kwargs)

        s3.Bucket(self, "MyBucket")
```

This creates an S3 bucket — without writing YAML.

---

# 🆚 CloudFormation vs CDK

| CloudFormation           | CDK                                             |
| ------------------------ | ----------------------------------------------- |
| Write YAML/JSON          | Write real programming code                     |
| Harder for complex logic | Easy loops, conditions, reuse                   |
| Native AWS service       | Uses CloudFormation behind the scenes           |
| Declarative              | Imperative (but generates declarative template) |

---

# 🎯 When to Use What?

### Use CloudFormation if:

* You prefer simple YAML templates
* You want native AWS-only solution
* Your infra is not very complex

### Use CDK if:

* You are comfortable with programming
* You want reusable components
* You need loops, conditions, dynamic logic

---

# 📌 Simple Summary

* **CloudFormation** = Write templates (YAML/JSON) to create AWS infrastructure
* **CDK** = Write code (Python/TypeScript) that generates CloudFormation
* Both are Infrastructure as Code tools
* CDK makes complex infrastructure easier

---


