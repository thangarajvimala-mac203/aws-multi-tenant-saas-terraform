# AWS Multi-Tenant SaaS Platform Using Terraform

## Project overview
This project is about building a multi-tenant Saas platform using AWS and Terraform.
The goal is to understand how real-world cloud infrastructure is designed, not just create resources.

## What is multi-tenants?
Multi-tenant architecture allows multiple customers(tenants) to use the same application while keeping their data isolated.

Example:
- tenant1.app.com
- tenant2.app.com

## Architecture Components
- AWS VPC (Networking)
- AWS ECS Fargate (Application Hosting)
- Application Load Balancer(Traffic Routing)
- AWS RDS PostgreSQL (Database)
- AWS Route53 (DNS)
- AWS Secrets manager (Secure Credentials)

## Architecture Flow
1.user Accesses the application using a domain
2.Route53 resolves s domain in ALB
3.ALB receives requestes
4.ECS Process requests
5.Application connects to database
6.Data stored per tenant schema

## Project goal

- Learn Terraform from beginner level
- Understand AWS services
- Build reusable modules
- Design real-world Saas architecture


## Architecture Diagram
(To be added)

## Project Structure

```text
.
├── environments/
│   └── dev/
├── modules/
├── tenant-config/
├── docs/
└── README.md

## Technologies used

- Terraform
- AWS ECS Fargate 
- AWS RDS postgreSQL
- AWS Application Loan Balancer 
- AWS Route53

## Future Improvements

- CI/CD pipeline
- WAF integrations
- Auto scaling



