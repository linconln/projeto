Project instructions
aplicar as configurações do Terraform

terraform init terraform apply

Run the following command to retrieve the access credentials for your cluster and configure kubectl.

aws eks --region 
(terraform output -raw cluster_name)

You can now use kubectl to manage your cluster and deploy Kubernetes configurations to it.

kubectl apply -f kubernetes
