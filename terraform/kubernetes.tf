data "terraform_remote_state" "eks" {
  backend = "s3"

  config = {
    bucket = "linconln-devops"
    key    = "devops"
    region = var.aws_region
  }
}

data "aws_eks_cluster" "cluster" {
  name = data.terraform_remote_state.eks.outputs.cluster_name
}

provider "kubectl" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  #  token                  = data.aws_eks_cluster_auth.main.token
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
  load_config_file = false
}

data "kubectl_path_documents" "docs" {
    pattern = "../kubernetes/*.yaml"
}

resource "kubectl_manifest" "test" {
    for_each  = toset(data.kubectl_path_documents.docs.documents)
    yaml_body = each.value
}