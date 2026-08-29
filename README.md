# AWS 3-Tier Architecture using Terraform

## Architecture
<img width="1100" height="978" alt="3  Terrafrom 3 Tier Architecure" src="https://github.com/user-attachments/assets/113e6599-3eb4-4a6e-b2f5-16a568e4e90d" />



## Project Overview

This project provisions a highly available 3-tier architecture
on AWS using Terraform.

## Architecture Components

### Networking
- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- NAT Gateway
- Route Tables
- Security Groups

### Compute
- EC2
- Application Load Balancer
- Target Groups
- Auto Scaling

### Database
- Amazon RDS
- Multi-AZ
- Read Replica
- DB Subnet Group

### Security
- Private subnet isolation
- Security Groups
- IAM Roles
- Restricted database access

## Architecture Flow

```text
                         Internet
                            |
                            |
                            |
                            |
                  +---------v----------+
                  | Application Load   |
                  | Balancer (ALB)     |
                  +---------+----------+
                            |
                            |
              +-------------+-------------+
              |                           |
      +-------v-------+           +-------v-------+
      | EC2 Instance  |           | EC2 Instance  |
      | Private       |           | Private       |
      | Subnet AZ-1   |           | Subnet AZ-2   |
      +-------+-------+           +-------+-------+
              |                           |
              +-------------+-------------+
                            |
                            |
                    +-------v--------+
                    | Amazon RDS     |
                    | MySQL          |
                    | Private       |
                    | Subnets       |
                    +----------------+

                    AWS VPC
             Multi-AZ Architecture
```
# ⚙️ Prerequisites

Before deploying the infrastructure, install:

### AWS CLI

Verify:

```bash
aws --version
```

### Terraform

Verify:

```bash
terraform version
```

### Git

Verify:

```bash
git --version
```

You also need an AWS account with appropriate IAM permissions.

---

# 🔑 Configure AWS Credentials

Configure the AWS CLI:

```bash
aws configure
```

Provide:

```text
AWS Access Key ID
AWS Secret Access Key
Default region
Output format
```

Verify your AWS identity:

```bash
aws sts get-caller-identity
```
# 🚀 Deployment

## Step 1: Clone the Repository

```bash
git clone https://github.com/Saisomasekhar/aws-3-tier-architecture-terraform.git
```

Navigate to the project:

```bash
cd aws-3-tier-architecture-terraform
```

---

## Step 2: Initialize Terraform

```bash
terraform init
```

This downloads the required Terraform providers and initializes the working directory.

---

## Step 3: Format Terraform Code

```bash
terraform fmt -recursive
```

---

## Step 4: Validate Configuration

```bash
terraform validate
```

Expected output:

```text
Success! The configuration is valid.
```

---

## Step 5: Review Execution Plan

```bash
terraform plan
```

Review the resources Terraform plans to create.

---

## Step 6: Deploy Infrastructure

```bash
terraform apply
```

