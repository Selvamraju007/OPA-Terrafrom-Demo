
# OPA + Terraform Demo

This demo shows how to use **Open Policy Agent (OPA)** with **Terraform** to enforce infrastructure compliance.

## Prerequisites
- Terraform >= 1.5
- Conftest (`brew install conftest` or `go install github.com/open-policy-agent/conftest@latest`)
- AWS CLI configured

## Steps
```bash
terraform init
terraform plan -out plan.tfplan
terraform show -json plan.tfplan > plan.json
conftest test plan.json
```

## Expected Output
- The first test should **fail** because the S3 bucket ACL is `public-read`.
- Update ACL to `private` in `main.tf` and re-run to see the policy pass.
