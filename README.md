# Demo Application Deployment

This is a quick guide on deploying the code in this repository
This is intended as a POC/demo of an application on eks exposed to the public with a db backend

### version build/test
the code was run and tested with the following
```bash
terraform --version | head -2 | tr '\n' ' '
Terraform v1.1.6 on linux_amd64

git --version
git version 2.35.1

aws --version
aws-cli/2.4.23 Python/3.8.8 Linux/5.15.26-1-lts exe/x86_64.arch prompt/off

kubectl version | head -1
Client Version: version.Info{Major:"1", Minor:"13", GitVersion:"v1.13.0", GitCommit:"ddf47ac13c1a9483ea035a79cd7c10005ff21a6d", GitTreeState:"clean", BuildDate:"2018-12-03T21:04:45Z", GoVersion:"go1.11.2", Compiler:"gc", Platform:"linux/amd64"}

builtin echo $BASH_VERSION
5.1.16(1)-release
```
also feel free to change buckets - right now bucket is hardcoded in state and backend files

### AWS credentials
> the following assumes the correct account access && permissions are set for default aws auth mechanisms
> i.e. AWS env vars with access key_id && secret or ~/.aws/config or iam role for host

---
### Running Terraform
FROM the base of the git repo
1. create original s3 bucket for storing state
```bash
export BASE=${PWD}
cd state
terraform init
terraform plan
terraform apply -auto-approve
```

2. create core terraform deployment (vpc/subnets/backup_vault/kms)
```bash
cd ${BASE}/core
terraform init
terraform plan
terraform apply -auto-approve
```

3. create eks cluster
```bash
cd ${BASE}/eks
terraform init
terraform plan
terraform apply -auto-approve
```

4. create rds db backend
```bash
cd ${BASE}/db
terraform init
terraform plan
terraform apply -auto-approve
```

5. create nginx controller deployment for k8s cluster
```bash
cd ${BASE}/helm/nginx
terraform init
terraform plan
terraform apply -auto-approve
```

6. create dummy application and expose to the internet for k8s cluster
```bash
cd ${BASE}/helm/application
terraform init
terraform plan
terraform apply -auto-approve
```

---
### Getting endpoint information

With time constraints, normally we would gen r53 info, ca, ssl, put up for https access but this is not currently enabled, 
so to view you'll need to just hit the public endpoint displayed in the k8s service (also the application mediawiki is currently set to redirect to `mediawiki`, so you should resolve this and add into your hosts override file (assuming using glibc && nsswitch references it)

```bash
aws eks list-clusters # get cluster name
aws eks update-kubeconfig ${cluster} # cluster should be result from last command
kubectl describe svc mediawiki # should see lb in output
host ${endpoint} # endpoint should be result from last command
builtin echo "${endpoint_ip} mediawiki" >> sudo tee -a /etc/hosts # you can ref home hosts override if honored
[[ "$(uname -s)" == "Linux" ]] && xdg-open http://mediawiki 
[[ "$(uname -s)" == "Darwin" ]] && open http://mediawiki 
[[ "$(uname -s)" == "SunOS" ]] && echo "please install something else"
[[ "$(uname -s)" == "MINGW64"* ]] && echo ":("
```

---
### refs/src/doc

- [mediawiki](https://bitnami.com/stack/mediawiki/helm)
- [nginx-ingress-controller](https://bitnami.com/stack/nginx-ingress-controller/helm)
- [terraform-aws-provider](https://registry.terraform.io/providers/hashicorp/aws/4.4.0)
- [terraform-helm-provider](https://registry.terraform.io/providers/hashicorp/helm/latest/docs)
- [Provision an EKS Cluster learn guide](https://learn.hashicorp.com/terraform/kubernetes/provision-eks-cluster)
- [terraform](https://www.terraform.io/docs)
- [aws](https://aws.amazon.com/console/)
