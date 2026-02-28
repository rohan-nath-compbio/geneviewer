#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if command -v Rscript >/dev/null 2>&1; then
  echo "Using local Rscript to run tests."
  Rscript -e "if(!requireNamespace('testthat', quietly=TRUE)) install.packages('testthat', repos='https://cloud.r-project.org')"
  Rscript -e "if(!requireNamespace('devtools', quietly=TRUE)) install.packages('devtools', repos='https://cloud.r-project.org')"
  Rscript -e "devtools::test()"
  exit 0
fi

if command -v docker >/dev/null 2>&1; then
  echo "Rscript not found. Falling back to Docker (rocker/r-ver:4.3.3)."
  DOCKER_CFG="$(mktemp -d)"
  trap 'rm -rf "$DOCKER_CFG"' EXIT
  docker --config "$DOCKER_CFG" run --rm -t \
    -v "$ROOT_DIR:/work" \
    -w /work \
    rocker/r-ver:4.3.3 \
    bash -lc "Rscript -e \"install.packages(c('testthat','devtools'), repos='https://cloud.r-project.org'); devtools::test()\""
  exit 0
fi

echo "Neither Rscript nor Docker is available."
echo "Install R (with Rscript) or Docker, then run scripts/run-tests.sh again."
exit 1
