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
4. [Usage](#usage)
5. [Contributing](#contributing)
6. [License](#license)

## Project Structure

```bash
├── terraform/
│   ├── main.tf                # Defines VPC, Subnet, and EC2 instance
│   ├── outputs.tf             # Outputs public IP and generates inventory file for Ansible
│   ├── variables.tf           # Input variables for Terraform
│   └── inventory.tpl          # Template for the Ansible inventory file
├── ansible/
│   ├── playbook.yml           # Playbook to install Nexus
│   └── roles/
│       └── nexus/
│           ├── tasks/         # Ansible tasks for Nexus installation
│           └── templates/     # Any necessary templates for Nexus configuration
├── Jenkinsfile                # Jenkins pipeline definition
├── docker/
│   ├── Dockerfile.terraform   # Jenkins agent Dockerfile for Terraform
│   └── Dockerfile.ansible     # Jenkins agent Dockerfile for Ansible
└── README.md                  # Project documentation
```
## Pre-requisites
**Before starting, ensure that you have the following tools installed and configured on your local machine:**

- AWS Account: To provision infrastructure on AWS.
- Terraform: Infrastructure as Code tool.
- Ansible: Configuration management tool.
- Jenkins: For setting up the CI/CD pipeline.
- Docker: For creating Jenkins agents.
