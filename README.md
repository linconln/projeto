Criação da infraestrutura usando github Actions e Terraform

Executar em Actions, create-eks.yaml
Os arquivos na pasta Terraform provem da documentação em:

Criar infra do EKS
https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks
O workflow deve ser executado manualmente e com aprovação do revisor posteriormente

Usar s3 para salvar o tfstate, criei manualmente conforme orientação do Leo
https://developer.hashicorp.com/terraform/language/settings/backends/s3

Aplicar manifestos do Kubernetes
O workflow executa no push para a branch main

https://dlmade.medium.com/ci-cd-with-github-action-and-aws-eks-5fd9714010cd

Foi necessário criar algumas variáveis e segredos no GITHUB
Não consegui recuperar as variáveis abaixo na etapa de CD, pois foram criadas no CI e tem valores fixos para não precisar alterar o código

  ECR_REPOSITORY: projeto
  EKS_CLUSTER_NAME: ADA-eks-Linconln
