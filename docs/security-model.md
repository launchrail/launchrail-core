# Security model

## Where Launchrail runs
Launchrail installs into the **customer's AWS account**. Launchrail does not host customer workloads.

## Key principles
- **Git is the source of truth**: Argo CD reconciles from Git.
- **No static AWS keys in pods**: use IRSA (IAM Roles for Service Accounts).
- **Least privilege**: IAM policies scoped per workload.
- **Secrets**: stored in AWS Secrets Manager / SSM; synced at runtime if needed.

## Recommended baseline controls
- Private subnets for nodes
- VPC endpoints for AWS APIs (optional)
- Admission policies for:
  - approved registries (ECR)
  - no privileged containers
  - required requests/limits and probes
