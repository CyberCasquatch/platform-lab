# Architecture

## Overview

A cloud infrastructure project demonstrating platform engineering practices including
Infrastructure as Code, configuration management, CI/CD pipelines, and monitoring.

## Architecture Diagram

```
┌─────────────────────────────────────────────┐
│                   GitHub                     │
│                                             │
│  platform-lab repo                          │
│  └── .github/workflows/ci.yml              │
│       ├── Terraform validate & plan         │
│       └── Ansible lint                      │
└─────────────────┬───────────────────────────┘
                  │ push triggers pipeline
                  ▼
┌─────────────────────────────────────────────┐
│              Developer Machine               │
│                                             │
│  terraform apply  ──────────────────────┐  │
│  ansible-playbook ──────────────────┐   │  │
└─────────────────────────────────────│───│──┘
                                      │   │
                                      ▼   ▼
┌─────────────────────────────────────────────┐
│              AWS ap-southeast-2              │
│                                             │
│  ┌──────────────────────────────────────┐  │
│  │  Security Group (platform-lab-sg)    │  │
│  │  ├── Inbound: SSH (22)              │  │
│  │  └── Inbound: HTTP (80)             │  │
│  └──────────────────────────────────────┘  │
│                                             │
│  ┌──────────────────────────────────────┐  │
│  │  EC2 t2.micro (Ubuntu 22.04)         │  │
│  │  ├── nginx (web server)             │  │
│  │  ├── htop (monitoring)              │  │
│  │  └── /etc/platform-lab-provisioned  │  │
│  └──────────────────────────────────────┘  │
└─────────────────────────────────────────────┘
```

## Components

**Terraform** provisions:
- EC2 t2.micro instance (free tier)
- Security group with SSH and HTTP access
- All resources tagged for environment and project tracking

**Ansible** configures:
- nginx web server installed and enabled on boot
- htop for process monitoring
- Marker file confirming automated provisioning

**GitHub Actions** validates on every push:
- Terraform format check, init, validate, and plan
- Ansible playbook linting with ansible-lint
