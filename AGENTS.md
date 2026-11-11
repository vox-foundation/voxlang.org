# AGENTS.md — `vox-foundation/voxlang.org` (Public Documentation Engine & `eval.voxlang.org` Sandbox)

This file governs coding agents working inside `vox-foundation/voxlang.org`.
- Sibling multi-repo workspace policy: [`../AGENTS.md`](../AGENTS.md) (when cloned in a sibling layout).
- Core compiler & documentation SSOT: [`vox-foundation/vox/AGENTS.md`](https://github.com/vox-foundation/vox/blob/main/AGENTS.md) (`${VOX_ROOT:-../vox}/AGENTS.md`).

## 1. Repository Identity & Separation of Concerns

- **Canonical GitHub Repository:** [`https://github.com/vox-foundation/voxlang.org`](https://github.com/vox-foundation/voxlang.org) (`Apache-2.0`)
- **Live Public Deployments:**
  - **Documentation Site (Cloudflare Pages):** [`https://voxlang.org`](https://voxlang.org) (deployed via `.github/workflows/docs-deploy-cloudflare.yml`, Cloudflare project `vox-docs`)
  - **Interactive Browser Eval Sandbox (Coolify):** [`https://eval.voxlang.org`](https://eval.voxlang.org) (`/v1/eval` running `vox run --interp --caps deterministic` via `vox-eval.compose.yml` and `.github/workflows/deploy-hetzner.yml`)
- **What Lives Here (and Only Here):**
  1. The Astro 7.4 + Starlight 0.42 site builder (`docs-astro/`), frontmatter-driven sidebar (`src/utils/sidebar.mjs`), `<VoxPlayground />` interactive island, and `/voxup` bootstrap scripts.
  2. The `vox-eval.compose.yml` Coolify deterministic interpreter sandbox configuration.
- **What Does NOT Live Here:**
  - Never hand-edit generated reference pages (`docs/src/reference/*.generated.md` or `docs/src/api/*.generated.md`); they are emitted from Rust source by `vox ci command-sync`.
  - Never hardcode machine-local paths (`/Users/...`); use `${VOX_ROOT:-../vox}` when referencing a sibling `vox` checkout.

## 2. Mandatory Context & Documentation Awareness

1. **Documentation System SSOT:** [`docs-system-ssot.md`](https://github.com/vox-foundation/vox/blob/main/docs/src/architecture/docs-system-ssot.md) and [`documentation-governance.md`](https://github.com/vox-foundation/vox/blob/main/docs/src/contributors/documentation-governance.md).
2. **Agent Discovery Index:** [`https://voxlang.org/.well-known/llms.txt`](https://voxlang.org/.well-known/llms.txt) (`${VOX_ROOT:-../vox}/docs/src/.well-known/llms.txt`).
3. **Multi-Repo Flywheel SSOT:** [`monorepo-to-multirepo-flywheel-ssot-2026.md`](https://github.com/vox-foundation/vox/blob/main/docs/src/architecture/monorepo-to-multirepo-flywheel-ssot-2026.md).

## 3. Rules for Keeping Documentation & Deployments Up to Date

1. **Frontmatter & Doctest Gate:**
   - Every Markdown file under `docs/src/` must begin with valid YAML frontmatter (`title`, `description`, `category`, `topic`, `domain`, `authorship`) and a 40–120 word `<!-- kb:summary -->` block.
   - Verify edits with:
     ```bash
     VOX_ROOT="${VOX_ROOT:-../vox}"
     cargo run --manifest-path "$VOX_ROOT/Cargo.toml" -p vox-doc-pipeline -- --lint-only --paths <file>
     ```
2. **Homepage `why_vox` Sync & Mirror Parity:**
   - The `<!-- ANCHOR: why_vox -->` block in `${VOX_ROOT:-../vox}/README.md` and `${VOX_ROOT:-../vox}/docs/src/index.mdx` is lint-synced; always update both together.
   - Keep `voxlang.org/README.md`, `voxlang.org/docs-astro/README.md`, and `${VOX_ROOT:-../vox}/docs-astro/README.md` byte-identical.
3. **Contract Parity:**
   - Any edit to `contracts/documentation/` must be synchronized with `${VOX_ROOT:-../vox}/contracts/documentation/` and pass:
     ```bash
     VOX_ROOT="${VOX_ROOT:-../vox}"
     cargo run --manifest-path "$VOX_ROOT/Cargo.toml" -p vox-cli -- ci cross-repo-parity
     cargo run --manifest-path "$VOX_ROOT/Cargo.toml" -p vox-cli -- ci federated-symbol-graph
     ```
