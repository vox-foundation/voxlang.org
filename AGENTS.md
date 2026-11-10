# AGENTS.md — Vox Documentation Site (`voxlang.org`)

This file governs coding agents working on the Vox documentation website.
Master multi-repo policy: [`/Users/brbrainerd/dev/AGENTS.md`](../AGENTS.md).
Core compiler reference: [`/Users/brbrainerd/dev/vox`](../vox).

## Repository Overview

- **Repository ID:** `voxlang.org`
- **Federation Role:** `docs-site` (declared in `../vox/.vox/repositories.yaml`)
- **License / Visibility:** Public (Apache-2.0)
- **Primary Source Surface:** `docs-astro` and `docs/src`

## Contract Parity & Boundaries

1. **Shared Contract Directories:**
   - `contracts/documentation/`: Taxonomy contracts (`kb-taxonomy.v1.yaml`), facet backlogs, and link allowlists.
   - Verified byte-identical across checkouts by `vox ci cross-repo-parity`.
2. **Astro & Markdown Rules:**
   - Authored docs under `docs/src/` require YAML frontmatter (`title`, `description`, `category`, `status`, `authorship`).
   - Sidebar is generated automatically from frontmatter; never edit `docs/src/SUMMARY.md` manually.
3. **Workspace Decoupling:**
   - Documentation authors and site designers can run Astro and test pages without loading or compiling Rust crates.

## Verification Commands

```bash
vox ci cross-repo-parity
vox ci federated-symbol-graph
vox ci standalone-sovereignty
```
