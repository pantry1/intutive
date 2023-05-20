# Terraform Infrastructure as Code (IaC)

This Terraform project creates a VPC in the `us-east-1` region, a public subnet, and EC2 instances with associated EBS volumes.

## Prerequisites

- Terraform installed on your local machine.
- AWS credentials configured with appropriate permissions.

## Usage

1. Clone the repository:

```shell
git clone <project>
cd <project>/devsecops/aws-infra/deploy

terraform plan
terraform apply

Exceptions:
AWS Security Group allows open egress vlunarablity can be fixed by restricting the outbound rules to desired network, but we leave it open for now
