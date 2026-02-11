#!/usr/bin/env bash
set -euo pipefail

CHART_DIR="${1:-helm/launchrail-demo}"

echo "==> Helm lint"
helm lint "$CHART_DIR"

echo "==> Rendering manifests"
RENDERED="$(mktemp)"
helm template launchrail-demo "$CHART_DIR" > "$RENDERED"

echo "==> Check: resources requests/limits exist"
if ! grep -q "resources:" "$RENDERED"; then
  echo "ERROR: resources block missing"
  exit 1
fi

echo "==> Check: readinessProbe exists"
if ! grep -q "readinessProbe:" "$RENDERED"; then
  echo "ERROR: readinessProbe missing"
  exit 1
fi

echo "==> Check: livenessProbe exists"
if ! grep -q "livenessProbe:" "$RENDERED"; then
  echo "ERROR: livenessProbe missing"
  exit 1
fi

echo "All CI guardrails passed."
