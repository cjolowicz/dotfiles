---
description: Clone a repo and enhance with AGENTS.md knowledge base
---

Clone a repository using opensrc and generate hierarchical AGENTS.md documentation.

<skill>
$FILE{../skills/opensrc/SKILL.md}
</skill>

## Workflow

### Step 1: Fetch the repository

```bash
npx opensrc <repo>
```

Where `<repo>` is extracted from the user request (supports `owner/repo`, `github:owner/repo`, full URL, etc.)

### Step 2: Navigate to fetched repo

After fetch completes, cd into the repo:

```bash
cd opensrc/repos/github.com/<owner>/<repo>/
```

Parse owner/repo from the input or from `opensrc/sources.json` after fetch.

### Step 3: Generate knowledge base

<skill>
$FILE{../skills/index-knowledge/SKILL.md}
</skill>

Execute in **update mode** (default) - modify existing AGENTS.md + create new where warranted.

### Step 4: Report completion

```
=== opensrc Complete ===

Repository: <owner>/<repo>
Location: opensrc/repos/github.com/<owner>/<repo>/

AGENTS.md files generated:
  ✓ ./AGENTS.md (root)
  ✓ ./src/... (if applicable)

The repository is now enhanced with agent context.
```

<user-request>
$ARGUMENTS
</user-request>
