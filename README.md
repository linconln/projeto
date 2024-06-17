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
Usa o repositório ECR da AWS para a imagem do docker
Alterar a referência no yaml para uma palavra chave que será substituída no processo de CD pelo caminho da imagem

https://dlmade.medium.com/ci-cd-with-github-action-and-aws-eks-5fd9714010cd

Foi necessário criar algumas variáveis e segredos no GITHUB
Não consegui recuperar as variáveis abaixo na etapa de CD, pois foram criadas no CI e tem valores fixos para não precisar alterar o código

  ECR_REPOSITORY: projeto
  EKS_CLUSTER_NAME: ADA-eks-Linconln

Como utilizo o mesmo código e lógica desde o primeiro módulo, é preciso executar no pod o app que gera os relatórios e lista os endereços de acesso.
No caso, o acesso aos relatórios também só funciona dentro do pod, pois não consegui fazer o ingress funcionar desde o kubernetes.
Desde que mudou pra containers, o funcionamento deixou de executar corretamente como feito no docker-compose

Inclusão do Sonar Cloud