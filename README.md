# Vox Documentation Site (`voxlang.org`)

Official documentation website and knowledge repository for the Vox programming language and ecosystem.

## Role & Architecture

- **Role:** `docs-site` in the Vox federation spine (`.vox/repositories.yaml`).
- **Visibility:** Public (Apache-2.0).
- **Core Technology:** Astro 5, Starlight, Tailwind CSS, Node.js + pnpm.
- **Independence:** Allows rapid documentation and tutorial development without invoking Cargo or building the compiler.

## Contracts & Parity

Synchronized shared contracts:
- `contracts/documentation/`: Taxonomy schemas, canonical symbol maps, KB facet definitions, and tutorial verification results.

Verified with:
```bash
vox ci cross-repo-parity
vox ci federated-symbol-graph
```

## Running & Developing

Documentation source files and the Astro site live under `docs/src` and `docs-astro` in the core repository.
To run the documentation dev server locally:
```bash
./scripts/dev-docs.sh
```
