# Guardrails

Guardrails are defaults and checks that prevent common production failures.

## CI guardrails (MVP)
- Helm lint
- YAML lint
- Verify requests/limits exist
- Verify readiness/liveness probes exist
- Verify images come from approved registries (e.g., ECR)

## Cluster guardrails (optional in MVP)
- Kyverno/Gatekeeper policies for:
  - no privileged containers
  - block hostPath
  - require labels
  - require requests/limits and probes
  - allow only approved registries

## AWS guardrails
- IRSA only (no static keys in pods)
- Secrets in Secrets Manager / SSM
- Private networking defaults
