# Runbook

## Prerequisites

- AWS CLI configured (`aws configure`)
- Terraform installed (`terraform -version`)
- Ansible installed (`ansible --version`)
- SSH key at `~/.ssh/platform-lab-key.pem`

## Provision Infrastructure

```bash
cd terraform
terraform init
terraform plan
terraform apply
```

## Configure Server

```bash
ansible-playbook ansible/playbook.yml -i ansible/inventory.ini
```

## Verify Deployment

Check nginx is live:
```bash
curl http://<instance_public_ip>
```

SSH into the server:
```bash
ssh -i ~/.ssh/platform-lab-key.pem ubuntu@<instance_public_ip>
```

Confirm Ansible ran:
```bash
cat /etc/platform-lab-provisioned
```

## Tear Down

```bash
cd terraform
terraform destroy
```
