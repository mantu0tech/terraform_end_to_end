---

# Terraform – Overview & Basics

## What is Terraform?

Terraform is an **Infrastructure as Code (IaC)** tool developed by **HashiCorp** that allows you to define, provision, and manage infrastructure using code.
hashimoto created terraform in 2017 it goes aware about terraform
it was open source till 2022
in 2023 terrafrom is not open source BSL you can create a new terrafrom of it then in 2025 HCL is acuried  by IBM 


### Key Characteristics

* Infrastructure as Code (IaC) tool
* Developed by **HashiCorp**
* Uses **HCL (HashiCorp Configuration Language)**
* **Released in 2014**
* **Multi-cloud support** (AWS, Azure, GCP, etc.)
* **Agentless** (no agents required on target systems)

---

## Terraform vs Chef / Puppet / Ansible

| Tool      | Type        | Primary Use        |
| --------- | ----------- | ------------------ |
| Terraform | Declarative | Infrastructure     |
| Ansible   | Imperative  | Configuration      |
| Chef      | Declarative | Configuration Mgmt |
| Puppet    | Declarative | Configuration Mgmt |

---

## Why Terraform?

### Core Reasons

* **Cloud-agnostic** – works across multiple cloud providers
* **State management** – tracks infrastructure state
* **Dependency graph** – automatically handles resource dependencies
* **Immutable infrastructure** – replaces rather than modifies resources

### Benefits

* **Version-controlled infrastructure**
* **Reusable modules**
* **Automation & consistency**

---

## Installing Terraform on Windows

### Installation Steps

1. Download the Terraform binary from HashiCorp
2. Extract the executable
3. Add Terraform to the system `PATH`

### Verify Installation

```bash
terraform version
```

---

## Terraform Lifecycle

Terraform follows a simple and predictable lifecycle:

1. **terraform init**
   Initializes the working directory and downloads providers

2. **terraform plan**
   Shows what Terraform will create, update, or delete

3. **terraform apply**
   Applies the planned changes to infrastructure

4. **terraform destroy**
   Destroys all managed infrastructure

---

## Declarative vs Imperative (VERY IMPORTANT)

### Imperative Approach

* Focuses on **how to do** something
* Step-by-step instructions
* Example tools: Ansible

### Declarative Approach

* Focuses on **what you want**
* Terraform figures out **how** to achieve it
* Preferred for infrastructure management

### Terraform’s Approach

Terraform uses a **declarative model**, which makes it:

* Easier to maintain
* More predictable
* Less error-prone

---

## Summary

Terraform enables teams to manage infrastructure safely, consistently, and efficiently using a declarative, cloud-agnostic approach with strong state management and automation capabilities.

---


