# terraform_eks_flux_sync_with_helm

## Install terraform on Amazon linux

```bash
sudo yum install -y yum-utils shadow-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform
```

## Install kubectl

```bash
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl
chmod +x ./kubectl
cp kubectl /usr/bin
kubectl version --short --client
```

## Install flux

```bash
wget https://github.com/fluxcd/flux2/releases/download/v0.27.4/flux_0.27.4_linux_amd64.tar.gz 
tar xvf flux_0.27.4_linux_amd64.tar.gz
mv flux /usr/bin
```

## Create Cluster and Deploy applciations

```bash
terraform init
terraform plan
terraform apply -auto-approve
```

## Connect to EKS cluster

```bash
aws eks update-kubeconfig --name demoeks-cluster --region us-east-1
```

## Check git repo details

```bash
kubectl get gitrepo
```

## Check kustomization 

```bash
kubectl get kustomization
```

## Check nginx pod details

```bash
kubectl get pods
```
