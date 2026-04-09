# Terraform AWS Blue/Green Deployment

This project demonstrates Blue/Green deployment using Terraform on AWS.

## 🚀 Architecture
- Application Load Balancer (ALB)
- Target Groups (Blue & Green)
- Auto Scaling Groups
- Launch Templates

## 🧠 Concept
- Blue = Production
- Green = New Version
- Traffic switching via ALB

## ⚙️ Setup

```bash
terraform init
terraform plan
terraform apply