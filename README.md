# AWS Infrastructure Repository

This repository contains the code and configurations for deploying and managing AWS infrastructure using Terraform, AWS CDK, Docker, and GitHub Actions workflows.

## Terraform

The `terraform` directory contains Terraform code for provisioning and managing AWS resources. It includes modules, variables, and configuration files for creating and managing your infrastructure.

To deploy the infrastructure using Terraform:

1. Navigate to the devsecops/aws-infra/deploy` directory
2. Initialize Terraform: `terraform init`.
3. Review and modify the variables in `main.tf` file as needed.
4. Plan the infrastructure changes: `terraform plan`.
5. Apply the changes and provision the infrastructure: `terraform apply`.

## AWS CDK

The `cdk` directory contains AWS CDK code for defining and deploying AWS infrastructure using Python. It includes constructs, stacks, and configuration files for managing your infrastructure as code.

To deploy the infrastructure using AWS CDK:

1. Navigate to the `cdk-project` directory.
2. Install the required dependencies: `pip install -r requirements.txt`.
3. Review and modify the code in the `cdk_project_stack.py` file in cdk-project/cdk-project as needed.
4. Deploy the AWS CDK stacks: `cdk deploy`.

## Docker

The `docker` directory contains Dockerfiles and configurations for building Docker images for your applications. It includes the necessary Dockerfiles, dependencies, and any additional configuration files.

To build and run Docker containers:

1. Navigate to the `docker` directory: `cd docker`.
2. Review and modify the Dockerfile(s) as needed.
3. Build the Docker image: `docker build -t my-app .`.
4. Run the Docker container: `docker run -d --name my-app-container my-app`.

## GitHub Actions Workflows

The `.github/workflows` directory contains workflow configurations for GitHub Actions. These workflows automate tasks such as validating, scanning, and deploying the infrastructure as code.

To use the workflows:

1. Modify the workflow configuration files in the `.github/workflows` directory as needed.
2. Commit and push the changes to trigger the workflows.
3. Monitor the workflow runs and review the logs and results in the GitHub Actions tab.

Please refer to the individual directories and files for more detailed instructions and configurations.


