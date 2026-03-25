# Terraform Infrastructure

This folder contains the Terraform configuration for provisioning the cloud infrastructure required by the 3-Tier Architecture FastAPI + React application.

## Structure
- `modules/` - Reusable Terraform modules for backend, frontend, database, networking, etc.
- `provider.tf` - Provider and backend configuration.
- `terraform.tfvars` - Variable values for this environment.
- `variables.tf` - Input variable definitions.
- `.terraformignore` - Files/folders ignored by Terraform.

## Remote State
Remote state is managed in AWS S3 with DynamoDB for state locking. Ensure the S3 bucket and DynamoDB table exist and are in the correct region.

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [AWS CLI](https://aws.amazon.com/cli/) configured with the correct profile and region
- AWS account with permissions to create resources

See QUICKSTART.md for setup instructions.
