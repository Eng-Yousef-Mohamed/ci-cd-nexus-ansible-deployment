# Nexus Installation on AWS EC2 with Terraform, Ansible, and Jenkins

## Project Overview

This project demonstrates the automated installation of Nexus on an AWS EC2 instance using a CI/CD pipeline with Terraform, Ansible, and Jenkins. The infrastructure will be provisioned via Terraform, while the configuration management and Nexus installation will be handled by Ansible. Jenkins will orchestrate the entire process using a pipeline, with two separate agents for Terraform and Ansible.

## Project Components

1. **Terraform:**
   - Creates the AWS infrastructure including a VPC, subnets, and a public EC2 instance (t2.medium).
   - Outputs an Ansible inventory file containing the public IP of the EC2 instance.
   - Pushes the inventory file to a GitHub repository for Ansible to consume.
   
2. **Ansible:**
   - Retrieves the inventory file from the GitHub repository.
   - Installs Nexus on the EC2 instance.
   - Configures the necessary settings and firewall rules.
   
3. **Jenkins:**
   - A Jenkins pipeline (Jenkinsfile) is used to automate the Terraform and Ansible processes.
   - Two Jenkins agents are used: 
     - One for running Terraform commands.
     - Another for running Ansible playbooks.

## Table of Contents

1. [Project Structure](#project-structure)
2. [Pre-requisites](#pre-requisites)
3. [Setup Instructions](#setup-instructions)
   - [Terraform Setup](#terraform-setup)
   - [Ansible Setup](#ansible-setup)
   - [Jenkins Setup](#jenkins-setup)
4. [Screenshots](#Screenshots)


## Project Structure

```bash
├── terraform/
│   ├── main.tf                # Defines VPC, Subnet, and EC2 instance
│   ├── variables.tf           # Input variables for Terraform
│   ├── ec2.tf                 # EC2 instance configuration
│   ├── internet_gateway.tf     # Internet gateway configuration
│   ├── security_group.tf       # Security group configuration
│   ├── ssh_key_pair.tf         # SSH key pair configuration
│   ├── vpc.tf                 # VPC configuration
│   ├── script.sh              # Script for additional provisioning tasks
│   └── value.auto.tfvars      # Variable values for Terraform
├── ansible/
│   ├── playbook.yml           # Playbook to install Nexus
│   └── roles/
│       └── nexus/
│           ├── tasks/         # Ansible tasks for Nexus installation
│           └── templates/     # Any necessary templates for Nexus configuration
├── Jenkinsfile                # Jenkins pipeline definition
├── Dockerfile
└── README.md                  # Project documentation

```
## Pre-requisites

Before starting, ensure that you have the following tools installed and configured on your local machine:

- AWS Account: To provision infrastructure on AWS.
- Terraform: Infrastructure as Code tool.
- Ansible: Configuration management tool.
- Jenkins: For setting up the CI/CD pipeline.
- Docker: For creating Jenkins agents.
## Setup Instructions
### Terraform Setup
Navigate to the terraform/ directory.
Initialize Terraform and apply the Terraform configuration to provision the VPC, subnets, and EC2 instance:
```bash
terraform init
terraform apply
```
Terraform will output an inventory file (inventory.ini) that includes the public IP of the EC2 instance.
The inventory file is automatically pushed to a designated GitHub repository for Ansible to use.


## Screenshots

### 1. Jenkins Dashboard

Here’s the Jenkins dashboard showing the pipeline stages for Terraform and Ansible:

![Jenkins Dashboard](images/jenkins-dashboard.png)

### 2. Terraform Output

This is the Terraform output after applying the configuration:

![Terraform Output](images/terraform-output.png)

### 3. Nexus Running on EC2

Nexus successfully running on the EC2 instance, accessible via the public IP:

![Nexus on EC2](images/nexus-ec2.png)
