Criação da infraestrutura usando github Actions e Terraform

Executar em Actions, create-eks.yaml
Os arquivos na pasta Terraform provem da documentação em:

Criar infra do EKS
https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks

Usar s3 tfstate
https://developer.hashicorp.com/terraform/language/settings/backends/s3

Aplicar manifestos do Kubernetes

https://registry.terraform.io/providers/gavinbunney/kubectl/latest/docs

Essa parte está com problema, usando o kubectl e alterando a instancia, funcionou como esperado