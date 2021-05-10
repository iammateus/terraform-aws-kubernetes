
# Terraform, Kubernetes & AWS

This repository contains an example of deploying and managing a [Kubernetes](https://kubernetes.io/) cluster to AWS using [Amazon EKS](https://aws.amazon.com/eks) and [Terraform](https://www.terraform.io/), an open-source infrastructure as code software tool. 

The provisioned Kubernetes cluster has sample resources that offer an IP-accessible Nginx server.

## Project structure
    .
    ├── k8s              #  Kubernetes manifests of the example server
    └── terraform        #  Terraform configuration files

## Requirements

- Terraform
- An  AWS account with the IAM permissions listed on the  [EKS module documentation](https://github.com/terraform-aws-modules/terraform-aws-eks/blob/master/docs/iam-permissions.md)
- A configured [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-install.html)
- [AWS IAM Authenticator](https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html)

## Usage

The requirements must be met for the commands below to work.

    # Change current directory to "terraform"
    $ cd terraform
    
    # Apply all changes to your AWS account
    $ terraform apply
	
    # After Terraform finishes applying the changes, you need to configure your kubectl.
    $ aws eks --region $(terraform output -raw region) update-kubeconfig --name $(terraform output -raw cluster_name)
   
    # Use kubectl to list all resources of the created namespace
    $ kubectl get all -n brincadeirinha

## License

[MIT](https://github.com/iammateus/terraform-kubernetes-aws/blob/main/LICENSE)
