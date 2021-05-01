provider "kubectl" {
  apply_retry_count      = 15
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  load_config_file       = false

  exec {
    api_version = "client.authentication.k8s.io/v1alpha1"
    command     = "aws-iam-authenticator"
    args = [
      "token",
      "-i",
      module.eks.cluster_id,
    ]
  }
}

data "kubectl_file_documents" "manifests" {
    content = file("../k8s/example.yaml")
}

resource "kubectl_manifest" "test" {
    count     = length(data.kubectl_file_documents.manifests.documents)
    yaml_body = element(data.kubectl_file_documents.manifests.documents, count.index)
}