#!/usr/bin/env bash
set -euo pipefail

need() {
  command -v "$1" >/dev/null 2>&1 || { echo "Missing required tool: $1"; exit 1; }
}

need terraform
need aws
need kubectl
need helm

echo "OK: prerequisites present."
aws --version
terraform version | head -n 1
kubectl version --client --short || true
helm version --short
