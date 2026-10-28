# Barrel of Monkeys

Agent skills for monkey brains. Straight from my own setup, for Claude Code, Codex and any agent that reads skills.

## Installation

A plugin updates itself. [skills.sh](https://skills.sh) copies editable files into your project, and you update them
by hand. Pick one per agent, because installing both gives you every skill twice.

### Claude Code

```bash
claude plugin marketplace add LovelyCodeMonkey/barrel-of-monkeys
claude plugin install barrel-of-monkeys@lovelycodemonkey
```

### Codex

```bash
codex plugin marketplace add LovelyCodeMonkey/barrel-of-monkeys
codex plugin add barrel-of-monkeys@lovelycodemonkey
```

### Any other agent (Cursor, OpenCode, Windsurf, ...)

```bash
npx skills@latest add LovelyCodeMonkey/barrel-of-monkeys
```

To update, run `npx skills@latest update`.

## Skills

### Productivity

- **[im-monkey-brained](./skills/productivity/im-monkey-brained/SKILL.md)**: your agent answers with an interactive
  visual TLDR instead of a wall of text. Cards of 2-3 plain sentences, step-throughs, diagrams, charts, and numbered
  questions that each come with a recommended pick. Made for dyslexia, ADHD, or a busy day.

  It shows inside the chat in T3 Code and the Codex app, and as a page in Claude Code. Agents without a visualizer
  give the same structure in tidy markdown.

  To get it on every long answer, add this to your `~/.claude/CLAUDE.md` or `~/.codex/AGENTS.md`:

  ```markdown
  Big blocks of text are hard for me to follow. For any answer longer than a line or two, or one that asks me to
  decide or do something, use the `im-monkey-brained` skill.
  ```

## License

[MIT](./LICENSE)
