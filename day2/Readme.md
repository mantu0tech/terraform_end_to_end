---

# Terraform Commands & Concepts

## Terraform Initialization

```bash
terraform init
```

Initializes the working directory and downloads required providers and modules.

---

## Terraform Validation

```bash
terraform validate
```

Checks whether the Terraform configuration syntax is valid.

---

## Terraform Planning

```bash
terraform plan
```

Shows the execution plan of what Terraform will create, update, or delete.

---

## Terraform Apply

```bash
terraform apply
```

Applies the changes required to reach the desired infrastructure state.

---

## Terraform State File (tfstate)

### What is tfstate file?

* `terraform.tfstate` is a file that stores the current state of infrastructure managed by Terraform.

### What does the tfstate file contain?

* Resource details
* Resource IDs
* Dependencies
* Metadata
* Provider information
* Current infrastructure state

---

## Terraform Destroy

```bash
terraform destroy
```

Destroys all infrastructure resources managed by Terraform.

---

## Terraform Format

```bash
terraform fmt
```

Formats Terraform configuration files according to standard style.

---

## Auto-Approve Apply

```bash
terraform apply --auto-approve
```

Applies changes without asking for confirmation.

---

## Auto-Approve Destroy

```bash
terraform destroy --auto-approve
```

Destroys infrastructure without asking for confirmation.

---

## Provider Download Behavior

* If you directly create a Terraform file and add AWS-related configuration, then run:

```bash
terraform init
```

Terraform will automatically download the required providers.

---

## Adding Provider Manually

* If you want to add the provider manually, define the provider block explicitly in the Terraform configuration file and then run:

```bash
terraform init
```

---

