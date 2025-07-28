# Terrafrom--modules

# 🎮 Super Mario Application Deployment on AWS EKS using Terraform

This project automates the complete deployment of the **Super Mario web application** on a **production-ready AWS Elastic Kubernetes Service (EKS) cluster**, using **Terraform** for infrastructure as code (IaC).

All AWS infrastructure components are provisioned modularly and efficiently, enabling both application deployment and future reuse of the environment with minimal effort.

---

## 🚀 Project Objective

> Deploy the **Super Mario application** on AWS EKS by **creating the entire infrastructure using Terraform**, making the environment modular and reusable for future Kubernetes-based projects.

---

## 🧱 Resources Provisioned with Terraform

The infrastructure is completely provisioned using Terraform modules with the following resources:

| Module        | Resources Created |
|---------------|-------------------|
| **VPC**       | Custom VPC with public subnets, route tables, internet gateway, and NAT gateway |
| **Security Groups** | Inbound rules for SSH (22), HTTP (80), HTTPS (443), and app port (8080) |
| **IAM**       | IAM roles for EKS cluster, worker nodes, and bastion EC2 with appropriate policies |
| **EKS**       | EKS control plane and managed node group (auto-scaled worker nodes) |
| **Bastion Host** | EC2 instance to access and manage the EKS cluster using `kubectl` |


---

├── main.tf # Root module connecting all components
├── variables.tf
├── terraform.tfvars
├── outputs.tf
└── modules/
├── vpc/ # Networking infrastructure
├── iam/ # IAM roles & policies
├── eks/ # EKS cluster and node group
└── bastion/ # Bastion EC2 instance


---

## 🔁 Reusability

This repository is **fully modular** and **reusable** for future Kubernetes projects:

> ✅ Simply **clone the repository**  
> ✅ Update minimal variables (like project name or instance types)  
> ✅ Run `terraform apply` to spin up the infrastructure in minutes

This **saves significant time** by avoiding repetitive environment setup for each project. No need to recreate VPCs, IAM roles, EKS clusters, or EC2-based jump servers.

---

## ⚙️ How to Use

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-username/super-mario-eks-terraform.git
cd super-mario-eks-terraform

Initialize and Apply
terraform init
terraform plan
terraform apply -auto-approve

For Future Projects
You can reuse this module in other repositories or projects.

No need to manually create infrastructure from scratch.

Helps maintain consistency across environments and saves hours of setup time.

✅ Just clone → update variables → terraform apply



