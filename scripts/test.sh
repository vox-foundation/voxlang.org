#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VOX_ROOT="${VOX_ROOT:-$(cd "$REPO_ROOT/../vox" && pwd)}"

cd "$VOX_ROOT"
cargo run --manifest-path "$VOX_ROOT/Cargo.toml" -p vox-doc-pipeline -- --lint-only "$@"
