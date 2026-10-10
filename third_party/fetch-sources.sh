#!/usr/bin/env bash
# Fetch selected public upstream source code for isolated research only.
# No build, install, integration, or execution of upstream source.
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MANIFEST="$ROOT/source-references.tsv"
DEST="$ROOT/checkouts"
SELECT="${1:-all}"
mkdir -p "$DEST"
found=0
while IFS=$'\t' read -r name url category priority; do
  [[ "$name" == "name" || -z "$name" ]] && continue
  if [[ "$SELECT" != "all" && "$SELECT" != "$name" ]]; then continue; fi
  found=1
  if [[ -e "$DEST/$name" ]]; then
    echo "SKIP $name: $DEST/$name already exists; review manually before updating"
    continue
  fi
  echo "FETCH $name -> $DEST/$name"
  git clone --depth 1 --single-branch "$url" "$DEST/$name"
  git -C "$DEST/$name" rev-parse HEAD | awk -v n="$name" '{print n " commit " $0}'
done < "$MANIFEST"
if [[ "$found" -eq 0 ]]; then echo "Unknown project: $SELECT" >&2; exit 2; fi
echo "Research-only clones. Before reproducible PoC, pin and record reviewed commit SHAs."
