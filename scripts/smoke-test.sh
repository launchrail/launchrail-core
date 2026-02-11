#!/usr/bin/env bash
set -euo pipefail

NAMESPACE="${1:-launchrail-demo}"
SERVICE="${2:-launchrail-demo}"
PORT="${3:-8080}"

echo "==> Checking pods"
kubectl -n "$NAMESPACE" get pods

echo "==> Port-forward and test endpoints"
kubectl -n "$NAMESPACE" port-forward "svc/$SERVICE" "$PORT:$PORT" >/tmp/launchrail-portforward.log 2>&1 &
PF_PID=$!
trap 'kill $PF_PID >/dev/null 2>&1 || true' EXIT

sleep 2
curl -fsS "http://localhost:$PORT/healthz" >/dev/null
curl -fsS "http://localhost:$PORT/readyz" >/dev/null
echo "OK: smoke test passed."
