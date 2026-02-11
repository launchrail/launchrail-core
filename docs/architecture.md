# Architecture

Launchrail runs inside the customer's AWS account.

## Core components

- **EKS**: Kubernetes runtime for workloads.
- **Argo CD**: GitOps controller; the only writer to the cluster.
- **Git repos**:
  - App repo: code + Helm chart.
  - Environments repo: per-environment values (image tags, sizing).
  - GitOps repo: Argo CD Applications/ApplicationSets (what is deployed where).
- **Guardrails**:
  - CI guardrails: linting and policy checks.
  - Cluster guardrails: admission policies (Kyverno/Gatekeeper) (optional in MVP).
  - AWS guardrails: IAM/IRSA, secrets, network defaults.

## Data flow

1. Developer pushes code to app repo.
2. CI builds image and pushes to ECR (immutable tags).
3. CI opens a PR to the environments repo updating the image tag.
4. Merge PR -> Argo CD sync -> workloads updated.

## Ownership boundaries

- Customer owns AWS account, clusters, workloads, and data.
- Launchrail provides installable tooling + patterns + guardrails.
