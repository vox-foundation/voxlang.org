#!/usr/bin/env bash
set -euo pipefail
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VOX_ROOT="${VOX_ROOT:-$(cd "$REPO_ROOT/../vox" && pwd)}"

pnpm --dir "$VOX_ROOT/docs-astro" build
