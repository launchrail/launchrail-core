# Launchrail Core

Launchrail is an AWS-native Internal Developer Platform (IDP) that provides **guarded, repeatable paths from code to production** using GitOps.

Launchrail **runs inside the customer’s AWS account**. Customers own their AWS infrastructure, workloads, and data. Launchrail provides the installable platform foundation: EKS + Argo CD + GitOps structure + guardrails + templates.

## What this repo contains

- **bootstrap/**: Terraform to create baseline AWS infrastructure (EKS + IAM OIDC + optional add-ons) and install Argo CD.
- **platform/**: GitOps-ready manifests (Argo CD Applications/App-of-apps patterns, namespaces, Argo Projects).
- **guardrails/**: Guardrails enforced at CI and cluster levels (scripts + policy examples).
- **templates/**: Golden-path templates (service template + environment values template).
- **docs/**: Architecture, install, security model, GitOps contract, operations and FAQ.
- **scripts/**: Helper scripts (verify prerequisites, smoke tests, etc.).

## Quick start (MVP)

1. **Install platform into your AWS account**
   - Follow `docs/install.md`
   - Run Terraform in `bootstrap/terraform`

2. **Deploy the demo service (or your service) using GitOps**
   - Create (or reuse) an environments repo (see `docs/gitops-contract.md`)
   - Use `platform/argocd/applications/dev/` to register apps in Argo CD

## Support boundaries (important)

Launchrail Core is designed to be:
- **Git-first**: desired state in Git, Argo CD reconciles.
- **Auditable**: changes via PRs (especially promotions).
- **Safe by default**: guardrails baked into templates and policies.

## License

Apache-2.0. See `LICENSE`.
