# Scalable Web Application Infrastructure on AWS (Terraform)

This project demonstrates how to deploy a secure, highly available, and auto-scalable web application infrastructure on **AWS** using **Terraform**. It includes a custom VPC, EC2 instances, an Application Load Balancer, Auto Scaling, Amazon RDS, and CloudWatch monitoring — all managed through Infrastructure as Code.

---

## 📌 Project Overview

- 🧩 Custom **VPC** with 3 public and 2 private subnets across multiple availability zones
- 🔐 **Amazon RDS** deployed in private subnets with restricted access
- ⚙️ **EC2 instances** launched via Launch Templates in public subnets
- 🌐 **Application Load Balancer (ALB)** routing HTTP traffic with health checks
- 📈 **Auto Scaling Group (ASG)** with CloudWatch alarms for CPU-based scaling
- 🧪 **Health checks** and API validation for real-time monitoring and zero downtime

---

## 📁 Repository Structure

aws-webapp-infra/
├── README.md # Project overview
├── architecture_diagram.png # Infrastructure diagram
├── screenshots.pdf # Configuration screenshots
├── Terraform/
│ ├── main.tf
│ ├── variables.tf
│ ├── outputs.tf
│ └── other .tf files


---

## 🧰 Tools & AWS Services

- **AWS**: VPC, EC2, RDS, ALB, Auto Scaling, CloudWatch
- **Terraform**: Infrastructure as Code (IaC)
- **Security Groups**: Network access control
- **CloudWatch**: Monitoring and alarms

---

## ⚙️ How to Deploy

> ✅ Prerequisites: Terraform installed & AWS credentials configured

```bash
cd Terraform
terraform init
terraform plan
terraform apply


