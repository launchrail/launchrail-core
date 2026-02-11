# GitOps contract

Launchrail standardizes three repositories:

## 1) App repository (owned by app team)
Contains:
- Source code
- Dockerfile
- Helm chart (no environment values)

Does not contain:
- Argo CD Applications
- environment values

## 2) Environments repository (owned by platform / environment owners)
Contains:
- per-environment values files (image tags, sizing)
- promotion history via PRs

Does not contain:
- Helm templates
- Argo CD Applications

## 3) GitOps repository (owned by platform)
Contains:
- Argo CD Applications/ApplicationSets
- namespace manifests
- Argo Projects

## Promotions
- dev -> qa -> prod via PRs updating image tags in the environments repo.
- Rollback is a PR reverting the tag.
