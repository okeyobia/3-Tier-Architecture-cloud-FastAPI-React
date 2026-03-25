# Terraform Quickstart Guide

This guide will help you set up and deploy the infrastructure for the 3-Tier Architecture FastAPI + React app using Terraform.

## 1. Prerequisites
- Install [Terraform](https://www.terraform.io/downloads.html) (v1.0+)
- Install [AWS CLI](https://aws.amazon.com/cli/)
- Configure your AWS credentials:
  - `aws configure --profile myprofile` (or use your preferred profile)
- Ensure your AWS user has permissions to create S3, DynamoDB, ECS, RDS, etc.

## 2. Prepare Remote State Backend
- Create an S3 bucket and DynamoDB table for remote state (if not already created).
- Update `provider.tf` with the correct bucket, DynamoDB table, region, and profile.

## 3. Initialize Terraform
```sh
cd terraform
terraform init
```

## 4. Plan Infrastructure Changes
```sh
terraform plan -var-file="terraform.tfvars"
```

## 5. Apply Infrastructure Changes
```sh
terraform apply -var-file="terraform.tfvars"
```

## 6. Destroy Infrastructure (if needed)
```sh
terraform destroy -var-file="terraform.tfvars"
```

## 7. Troubleshooting
- If you see `The config profile (myprofile) could not be found`, run `aws configure --profile myprofile` or update the profile in `provider.tf`.
- Ensure your AWS region matches between CLI, provider.tf, and remote backend resources.
- For more help, see the [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs).
