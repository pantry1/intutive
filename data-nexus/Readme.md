# Terraform Infrastructure Deployment and Destruction Guide

This guide provides step-by-step instructions for deploying and destroying infrastructure using Terraform.

## Prerequisites

Before you begin, make sure you have the following:

1. [Terraform](https://www.terraform.io/downloads.html) installed on your local machine.
2. Access to the necessary cloud provider account (e.g., AWS, Azure, GCP).

## Deployment Steps

Follow these steps to deploy the infrastructure using Terraform:

1. Clone this repository to your local machine:
   ```
   git clone https://github.com/pantry1/intutive.git
   cd intutive
   ```

2. Navigate to the `data` directory:
   ```
   cd data
   ```

3. Initialize Terraform:
   ```
   terraform init
   ```

4. Review the `variables.tf` file and set the appropriate values for your infrastructure.

5. Run Terraform plan to see what will be created:
   ```
   terraform plan
   ```

6. If the plan looks good, apply the changes:
   ```
   terraform apply --auto-approve
   ```

7. Confirm the deployment by reviewing the output and checking your cloud provider's console.

## Destruction Steps

To destroy the deployed infrastructure, follow these steps:

1. Navigate to the `data` directory if you're not already there:
   ```
   cd data
   ```

2. Run Terraform plan to see what will be destroyed:
   ```
   terraform plan -destroy
   ```

3. If the plan looks correct, proceed with destruction:
   ```
   terraform destroy
   ```

4. Confirm the destruction by reviewing the output and checking your cloud provider's console.

## Rotating the Secrets

To rotate the secrets like Bitbucket password and ElasticSearch password , follow these steps:

1. Navigate to the `data` directory if you're not already there:
   ```
   cd data
   ```

2. Run Terraform plan to see what will be destroyed:
   ```
   terraform state list
   ```

3. If the plan looks correct, proceed with destruction:
   ```
   terraform taint random_string.es_password 
   terraform taint random_string.bitbucket_password
   ```

4. Now apply the terraform script to recreate new secrets.
   ```
    terraform apply --auto-approve
   ```