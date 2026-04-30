# Platform Lab

A cloud infrastructure project built to demonstrate platform engineering practices.

## What This Project Does

Provisions and configures a cloud server on AWS using Infrastructure as Code,
automated configuration management, and a CI/CD pipeline — with no manual
server setup.

## Technologies

| Tool | Purpose |
|---|---|
| Terraform | Provision AWS infrastructure |
| Ansible | Automated server configuration |
| GitHub Actions | CI/CD pipeline |
| AWS EC2 | Cloud compute (free tier) |
| nginx | Web server |

## How It Works

1. Terraform creates an EC2 instance and security group in AWS Sydney
2. Ansible connects via SSH and installs/configures nginx automatically
3. GitHub Actions runs on every push — validating Terraform and linting Ansible

## Quick Start

See [docs/runbook.md](docs/runbook.md) for full instructions.

## Architecture

See [docs/architecture.md](docs/architecture.md) for a full diagram.

## CI/CD

Every push to `main` triggers the pipeline which runs:
- `terraform fmt -check` — enforces consistent formatting
- `terraform validate` — checks configuration is valid
- `terraform plan` — confirms no unexpected infrastructure changes
- `ansible-lint` — enforces Ansible best practices
