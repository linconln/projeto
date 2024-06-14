terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.48.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.16.1"
    }
  }
}

data "terraform_remote_state" "eks" {
#  backend = "local"
#  config = {
#    path = "../terraform/.terraform/terraform.tfstate"
#  }
  backend  = "s3"
  config = {
    bucket = "linconln-devops"
    key    = "devops"
    region = "us-east-1"
  }
}

# Retrieve EKS cluster information
provider "aws" {
#  region = data.terraform_remote_state.eks.outputs.region
  region = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_name
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "aws"
    args = [
      "eks",
      "get-token",
      "--cluster-name",
      data.aws_eks_cluster.cluster.name
    ]
  }
}
