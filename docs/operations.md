# Operations

## Day-2 checks
- Argo CD sync status
- Kubernetes rollout status
- Logs and events
- Rollback by reverting image tag in environments repo

## Useful commands
```bash
kubectl get pods -A
kubectl -n argocd get applications
kubectl rollout status deploy/<name> -n <ns>
kubectl describe pod <pod> -n <ns>
```
