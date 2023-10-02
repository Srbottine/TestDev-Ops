## Configuração de um Cluster Kubernetes na AWS EC2

# Passo 1: Terraform
Criado um diretório para o seu projeto Terraform e navegue até ele:
 
neste projeto foi divido o arquivo as instancias, ec2, main, subnets

Execute os seguintes comandos Terraform para criar a infraestrutura:

terraform init
terraform plan
terraform apply


# verificação de execução 

Verifique se a execução do comando terraform apply foi concluída sem erros.
Confirme no painel da AWS se a VPC, subnets e instância EC2 foram criadas com sucesso.
Use o endereço IP público da instância EC2 para acessá-la via SSH e verifique se você pode fazer login com ê

#Obs: apos a execução utilize o comando terraform destroy para destruir todos os componentes criados pelo terraform

# Passo 2: Kubernetes na EC2
Criado um script de inicialização para configurar o Kubernetes na instância EC2.

você pode encontrar esse arquivo na pasta com o nome k8s-setup.sh


1. Salve o arquivo, como k8s-setup.sh. Certifique-se de que o arquivo tenha a extensão .sh, indicando que é um script shell.

2. navegue ate aonde o arquivo esta:
cd ~/

3. Tornar o script executável:
chmod +x k8s-setup.sh

4. Execute o script de inicialização:
./k8s-setup.sh

O script será executado na instância EC2, instalando e configurando o Kubernetes conforme especificado no script.

#Obs: dentro do arquivo esta descrito oque cada coisa faz antes de iniciar.

# verificação de execução:


Verifique se o Kubernetes foi instalado com êxito, executando comandos:

kubectl get nodes e kubectl cluster-info.

Certifique-se de que a instância EC2 está respondendo nas portas necessárias, como 6443, que é usada para acessar o API server do Kubernetes.


# Passo 3: Subir os Pods
Criado arquivos YAML para os pods WordPress e MySQL. 

Aplique esses arquivos YAML ao cluster:

kubectl apply -f wordpress.yaml
kubectl apply -f mysql.yaml

# verificação de execução:

Use o kubectl apply para implantar os Pods no cluster.

Verifique se os Pods estão em execução usando kubectl get pods.

Certifique-se de que os serviços estão acessíveis dentro do cluster, por exemplo, usando kubectl exec para verificar a conectividade entre o WordPress e o MySQL.



# Passo 4: Ingress
Configurado um controlador de Ingress, como o NGINX Ingress Controller:

kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.0.4/deploy/static/provider/cloud/deploy.yaml

e foi criado um arquivo ingress.yaml para regras de roteamento.

# verificação de execução: 

Configure o Ingress para tornar os serviços acessíveis externamente.

Verifique se o Ingress está configurado corretamente usando kubectl get ingress e verifique o status.



# Passo 5: GitLab-CI
Escrito um arquivo .gitlab-ci.yml para automatizar o deploy dos pods (wordpress e mysql). 

# verificação de execução:

Configure um pipeline no GitLab CI/CD que execute o deploy sempre que você fizer push para o repositório GitLab.

Acesse o WordPress usando o endereço público do Ingress para verificar se a aplicação está acessível e funcionando corretamente.

Realize testes para garantir que o WordPress possa se conectar ao MySQL e que todas as funcionalidades estejam funcionando.
