# AGENTS.md — Vox Documentation Site & Playground (`vox-foundation/voxlang.org`)

This file governs coding agents working on **`voxlang.org`**, the public documentation website and interactive browser playground for Vox.
Master multi-repo policy: [`/Users/brbrainerd/dev/AGENTS.md`](../AGENTS.md).
Core compiler & documentation SSOT: [`/Users/brbrainerd/dev/vox/AGENTS.md`](../vox/AGENTS.md).

## Repository, GitHub & Coolify / Cloudflare Overview

- **Repository ID:** `voxlang.org`
- **Canonical GitHub Remote:** `https://github.com/vox-foundation/voxlang.org.git` (Public, `Apache-2.0`, under `vox-foundation` — never personal `brbrainerd`)
- **Federation Role:** `docs-site` (declared in `../vox/.vox/repositories.yaml`)
- **Live Production Targets:**
  - **Static Docs & `/voxup` Installer (`https://voxlang.org`):** Built by Astro 7.4.5 + Starlight 0.42.9 (`docs-astro/`) and deployed to Cloudflare Pages (`vox-docs` project) via `.github/workflows/docs-deploy.yml`.
  - **Deterministic Browser Eval Sandbox (`https://eval.voxlang.org`):** Managed on Coolify via `vox-eval.compose.yml` and `vox ci coolify-eval sync-compose --compose vox-eval.compose.yml --domains https://eval.voxlang.org` (`.github/workflows/coolify-eval-sync.yml` and `.github/workflows/deploy-hetzner.yml`).

## Cross-Repo Context & Documentation Governance (Required Reading)

When working in `voxlang.org`, you are operating across the 4-repository **Vox Foundation** federation (`vox`, `vox-axis`, `voxlang.org`, `vox-ops`). Always consult:

1. **Documentation System SSOT:** [`/Users/brbrainerd/dev/vox/docs/src/architecture/docs-system-ssot.md`](../vox/docs/src/architecture/docs-system-ssot.md) and [`/Users/brbrainerd/dev/vox/docs/src/contributors/documentation-governance.md`](../vox/docs/src/contributors/documentation-governance.md).
2. **Agent Discovery Index:** [`/Users/brbrainerd/dev/vox/docs/src/.well-known/llms.txt`](../vox/docs/src/.well-known/llms.txt).
3. **Multi-Repo Flywheel SSOT:** [`/Users/brbrainerd/dev/vox/docs/src/architecture/monorepo-to-multirepo-flywheel-ssot-2026.md`](../vox/docs/src/architecture/monorepo-to-multirepo-flywheel-ssot-2026.md).

## Mandatory Rules for Keeping Documentation Up to Date

1. **Frontmatter & KB Taxonomy Contract:**
   - Every authored `.md` / `.mdx` file under `docs/src/` MUST start with valid YAML frontmatter (`title`, `description`, `category`, `topic`, `domain`, `authorship`) and a 40–120 word `<!-- kb:summary -->` block under the H1, validated against `contracts/documentation/kb-taxonomy.v1.yaml`.
   - Always verify edits with:
     `cargo run -p vox-doc-pipeline --manifest-path /Users/brbrainerd/dev/vox/Cargo.toml -- --lint-only --paths <file>`
2. **Compiler-Verified `.vox` Doctests:**
   - Fenced `vox` code blocks are compiled by `vox-doc-pipeline`. Never write pseudo-code that fails `vox check`.
3. **Homepage `why_vox` Sync:**
   - The `<!-- ANCHOR: why_vox -->` block in `/Users/brbrainerd/dev/vox/README.md` and `/Users/brbrainerd/dev/vox/docs/src/index.mdx` is lint-synced; always update both together.
4. **Shared Contract Parity (`contracts/documentation/`):**
   - Any edit to `contracts/documentation/` must be synchronized with `/Users/brbrainerd/dev/vox/contracts/documentation/` and pass `vox ci cross-repo-parity`.

## Verification Commands

```bash
/Users/brbrainerd/dev/vox/target/debug/vox ci cross-repo-parity
/Users/brbrainerd/dev/vox/target/debug/vox ci federated-symbol-graph
cargo run -p vox-doc-pipeline --manifest-path /Users/brbrainerd/dev/vox/Cargo.toml -- --lint-only
```
