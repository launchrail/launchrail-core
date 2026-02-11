# Service template

This template is a golden path for services onboarded to Launchrail.

Includes:
- Dockerfile pattern (non-root optional)
- Helm chart with:
  - requests/limits
  - readiness/liveness
  - standard labels
- `service.yaml` metadata stub (owner/team/runbook)

Your CLI (later) can scaffold new services from this folder.
