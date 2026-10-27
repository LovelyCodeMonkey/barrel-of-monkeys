# Working on this repo

Agent skills, published as a Claude Code and Codex plugin and through `npx skills`.

## Layout

- Each skill is `skills/<bucket>/<name>/SKILL.md`, plus `agents/openai.yaml` for Codex. The folder name matches
  `name:` in the frontmatter, in kebab-case.
- `productivity/` holds shipped skills. Public betas go in `in-progress/`, which stays out of `plugin.json` and the
  README skill list. Add a bucket only when a skill needs it, and give it a README.md.

## Rules

- A shipped skill appears in both the README skill list and the `skills` array in `.claude-plugin/plugin.json`. A beta
  appears in neither.
- After touching `.claude-plugin/`, run `claude plugin validate .` and fix every error.
- Bump `version` in `plugin.json` when a shipped skill changes, so plugin installs pick it up.
- Quote a frontmatter `description` that contains ": ". Unquoted, it breaks the YAML and `npx skills` silently skips
  the skill.
- Skills are for anyone: no personal names, home-folder paths, private tools or secrets. Personal tweaks belong in
  your own CLAUDE.md or AGENTS.md.
- A skill the user starts by typing a phrase gets `disable-model-invocation: true` in SKILL.md and
  `policy.allow_implicit_invocation: false` in `agents/openai.yaml`, so agents never start it on their own.
- `CLAUDE.md` imports this file. Edit this one.
