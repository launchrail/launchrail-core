# Install Launchrail Core (AWS)

This guide installs the Launchrail platform foundation into **your AWS account**:
EKS + IAM OIDC/IRSA + Argo CD + baseline namespaces.

## Prerequisites

- AWS account with permissions to create EKS/VPC/IAM resources
- Local tools:
  - Terraform >= 1.6
  - AWS CLI v2
  - kubectl
  - helm

## Steps

1) Configure AWS credentials
- Ensure `aws sts get-caller-identity` works.

2) Initialize Terraform
```bash
cd bootstrap/terraform
terraform init
```

3) Create a `terraform.tfvars`
```hcl
project_name = "launchrail"
region       = "us-east-1"
cluster_name = "launchrail-eks"
```

4) Plan and apply
```bash
terraform plan
terraform apply
```

5) Configure kubeconfig (output shows the command)
```bash
aws eks update-kubeconfig --region <region> --name <cluster_name>
kubectl get nodes
```

6) Validate Argo CD
```bash
kubectl -n argocd get pods
```

## Next

- Create/point your GitOps repo to `platform/` or copy `platform/` into your GitOps repo.
- Register your first application using `platform/argocd/applications/dev/`.
