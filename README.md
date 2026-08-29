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


