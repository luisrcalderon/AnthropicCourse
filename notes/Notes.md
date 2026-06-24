## Claude Code Skills — Scope Hierarchy

There are exactly 4 scope levels, ranked by precedence (highest wins on name collision):

```
1. Enterprise   ──┐
2. Personal       ├─► same-name skill: higher level always wins
3. Project        │
4. Plugin       ──┘
                     (Plugins are namespaced, so they never collide with the others)
```

### 1. Enterprise
- **Path:** managed settings, controlled by org IT/MDM (not a folder you touch directly)
- **Scope:** every user in the organization
- **Who edits it:** IT/admins, centrally
- **Use case:** org-wide mandatory skills (compliance, security workflows)

### 2. Personal
- **Path:** `~/.claude/skills/<skill-name>/SKILL.md`
- **Scope:** all of *your* projects, across machines/repos
- **Who edits it:** you
- **Use case:** your own personal workflow shortcuts you want everywhere

### 3. Project
- **Path:** `.claude/skills/<skill-name>/SKILL.md` (checked into the repo)
- **Scope:** this repo only — shared with the whole team via version control
- **Who edits it:** anyone on the project, via PR
- **Use case:** repo-specific automation (e.g. the `pr-description` skill)
- **Note:** in a monorepo, nested `.claude/skills/` folders are picked up too, and namespaced like `apps/web:deploy` if there's a name clash

### 4. Plugin
- **Path:** `<plugin>/skills/<skill-name>/SKILL.md`, bundled inside an installed plugin
- **Scope:** wherever the plugin is enabled
- **Who edits it:** the plugin author (installed via marketplace, not hand-edited)
- **Use case:** reusable skill packs distributed independently of any one repo
- **Naming:** always namespaced as `/plugin-name:skill-name` so it can never silently override your own skills

### Map (file → scope)

| Scope | Example path | Invoked as |
|---|---|---|
| Enterprise | managed settings (no local path) | `/skill-name` |
| Personal | `~/.claude/skills/foo/SKILL.md` | `/foo` |
| Project | `.claude/skills/pr-description/SKILL.md` | `/pr-description` |
| Plugin | `my-plugin/skills/review/SKILL.md` | `/my-plugin:review` |

Below that sits a 5th, unranked fallback: Claude Code's **built-in bundled skills** (`/code-review`, `/security-review`, etc.) — any of the 4 scopes above can override these by reusing the same name.

Source: https://code.claude.com/docs/en/skills.md

---

## CLAUDE.md vs Skills

| CLAUDE.md | Skills |
|---|---|
| Project-wide standards that always apply | Task-specific expertise |
| Constraints like "never modify the database schema" | Knowledge that's only relevant sometimes |
| Framework preferences and coding style | Detailed procedures that would clutter every conversation |

## Subagents vs Skills

| Subagents | Skills |
|---|---|
| You want to delegate a task to a separate execution context | You want to enhance Claude's knowledge for the current task |
| You need different tool access than the main conversation | The expertise applies throughout a conversation |
| You want isolation between delegated work and main context | |

## Hooks vs Skills

| Hooks | Skills |
|---|---|
| Operations that should run on every file save | Knowledge that informs how Claude handles requests |
| Validation before specific tool calls | Guidelines that affect Claude's reasoning |
| Automated side effects of Claude's actions | |
