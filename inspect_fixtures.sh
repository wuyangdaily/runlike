#!/bin/bash
set -e
FIXTURES=("runlike_fixture1" "runlike_fixture2")

for f in "${FIXTURES[@]}"; do
  if docker ps -a -q -f name="$f" >/dev/null; then
    echo "Inspecting container $f"
    docker inspect "$f"
  else
    echo "Container $f does not exist, skipping"
  fi
done
