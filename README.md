# Terraform, Kubernetes & AWS

This repository contains an example of deploying and managing a [Kubernetes](https://kubernetes.io/) cluster to AWS using [Amazon EKS](https://aws.amazon.com/eks) and [Terraform](https://www.terraform.io/), an open-source infrastructure as code software tool. 

The provisioned Kubernetes cluster has example resources that delivers a basic nginx server accesible via an IP.

## Project structure
    .
    ├── k8s              #  Kubernetes manifests of the example server
    └── terraform        #  Terraform configuration files
