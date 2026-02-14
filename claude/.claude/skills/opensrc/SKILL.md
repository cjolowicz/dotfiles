---
name: opensrc
description: Fetch source code for npm packages and GitHub repos using the opensrc CLI. Use when needing implementation context beyond type definitions, comparing library internals, or cloning repos for agent analysis.
---

# opensrc

Fetch package/repo source code for deep implementation context.

## CLI Usage

```bash
npx opensrc <spec> [<spec>...] [--modify | --modify=false]
npx opensrc list
npx opensrc remove <name>
```

## Spec Formats

| Format | Example | Notes |
|--------|---------|-------|
| `<name>` | `zod` | npm package, version from lockfile |
| `<name>@<version>` | `zod@3.22.0` | Specific version |
| `owner/repo` | `vercel/ai` | GitHub shorthand |
| `github:owner/repo` | `github:facebook/react` | Explicit prefix |
| `owner/repo@<ref>` | `vercel/ai@v1.0.0` | Tag or branch |
| `owner/repo#<branch>` | `vercel/ai#main` | Branch |
| Full URL | `https://github.com/colinhacks/zod` | GitHub URL |

Mix packages and repos in one command: `npx opensrc zod facebook/react`

## Output Structure

```
opensrc/
├── settings.json    # { "allowFileModifications": true }
├── sources.json     # Package index
└── <source>/        # Fetched source tree
    ├── src/
    ├── package.json
    └── ...
```

### sources.json

```json
{
  "packages": [
    { "name": "zod", "version": "3.22.0", "path": "opensrc/zod" }
  ]
}
```

GitHub repos stored as `opensrc/<owner>--<repo>/` (double-dash separator).

## File Modifications

First run prompts to modify (saved in `settings.json`):

| File | Change |
|------|--------|
| `.gitignore` | Adds `opensrc/` |
| `tsconfig.json` | Excludes `opensrc/` |
| `AGENTS.md` | Documents source availability |

Override: `--modify` (allow) or `--modify=false` (deny).

## Workflow: Fetch and Explore

```bash
# 1. Fetch
npx opensrc vercel/ai

# 2. Check what was fetched
cat opensrc/sources.json

# 3. Explore structure
ls opensrc/vercel--ai/src/

# 4. Read source files directly
# Files are plain source — use Read tool on opensrc/<source>/path/to/file.ts
```

## Key Behaviors

- **Auto-sync**: Re-running `npx opensrc <pkg>` updates to installed version
- **Lockfile detection**: Reads `package-lock.json`, `pnpm-lock.yaml`, `yarn.lock`
- **Idempotent**: Safe to re-run — skips if already fetched at same version
- **Multiple sources**: Fetch many in one command for comparison workflows

## Common Patterns

### Compare library implementations

```bash
npx opensrc zod valibot yup
# Then grep/read across opensrc/zod/, opensrc/valibot/, opensrc/yup/
```

### Get context for a dependency

```bash
npx opensrc react
# Read opensrc/react/src/ to understand internals
```

### Clone repo for agent analysis

```bash
npx opensrc owner/repo
cd opensrc/owner--repo/
# Now run index-knowledge or explore the codebase
```
