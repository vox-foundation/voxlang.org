#!/usr/bin/env bash
set -euo pipefail
# Launch documentation development server for voxlang.org
VOX_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../vox" && pwd)"
cd "$VOX_ROOT/docs-astro"
pnpm dev
