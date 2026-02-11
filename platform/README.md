# Platform GitOps manifests

This folder contains GitOps-friendly manifests you can copy into your GitOps repository.

Recommended approach:
- Keep a dedicated GitOps repo (e.g., `launchrail-gitops`)
- Copy `platform/argocd` and `platform/namespaces` into that repo
- Let Argo CD manage these resources from Git
