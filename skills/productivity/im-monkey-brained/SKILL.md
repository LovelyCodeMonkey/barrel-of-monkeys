---
name: im-monkey-brained
description: Present plans, status updates, summaries, reviews, explanations, decisions and questions to the user as a visual TLDR in the host's interactive visualizer - something to look at and play with, not a page to read - with cards of 2-3 plain sentences, step-throughs, what-if toggles, option switchers, decision flows and other diagrams, charts, code blocks, and numbered questions with a pick. Always use the host's interactive visualizer first (T3 Code's html_render, Codex's Visualize, Claude Code's Artifacts), with a per-host exception list. The user is dyslexic and has ADHD and asked for this format for every such answer. Use whenever a reply is more than a line or two, or asks the user to decide or do something. When the user only asks to see a file (a skill, a .md), show the file as raw markdown instead.
---

# Im-monkey-brained

Read this whole file before you build a page. The rules for each host, the colour fallbacks and the skeleton are near the end.

## Who it is for

The user is dyslexic and has ADHD. Big blocks of text are hard to focus on and follow, and long answers get skipped, so
anything that matters must be easy to scan. They asked for this format for every answer: "from now on it's always
presented in this way for me".

Brief does not mean empty. A first version with only icons and short labels was too thin: it showed *what*, but lost
*why*, what already exists and what is blocking. Each topic needs 2-3 sentences that carry the crucial fact and its
reason.

## Pick the format

The interactive visualizer comes first. Plain text is the exception. Go down this list and use the first that fits:

1. **A one-line answer** ("done", yes/no, a path) → one plain line.
2. **The user only asked to see a file** (a skill, a `.md`, a config) → the file as it is. See "Showing a file".
3. **The host has an interactive visualizer** → the visual TLDR. This covers plans, status, summaries, reviews,
   explanations, decisions, and anything the user must answer or do. Where the visualizer opens outside the chat, only
   for big answers (see "Hosts and exceptions").
4. **No visualizer, or the user asked for plain text** → the same structure in markdown.

## The method

1. **Collect the facts.** Reread the long answer and any saved plan. List every fact as a short line.
2. **Sort them into topics.** Use the page order below. A fact that fits no topic is probably not crucial.
3. **Cut.** Keep only facts that change a decision or set an expectation. Drop internals (file names, setting names,
   library versions, process names, code) unless the user asked for them or must run something.
4. **Write 2-3 sentences per topic.** Plain words, one idea per sentence, about 20 words or fewer each. Bold 1-3 key
   phrases per card so the eye can skim.
5. **Add a picture where one helps.** See "Pictures". The picture supports the sentences; it does not replace them.
6. **Make it something to play with** where that helps understanding. See "Make it interactive".
7. **Order the page.** See "Page order".
8. **Build it in the host's visualizer**, preview it, try every button, fix wrapping or overflow, then show it. See
   "Hosts and exceptions".
9. **Reply in chat with 1-2 lines** after the page: only the action the user needs to take. Never restate the page.

## Page order

1. **Answers to the user's questions**: one card per question they asked, always first.
2. **Status**: a row of chips: done (green ✓), not done (grey ○), waiting on the user (amber ⏸).
3. **Topics**, the ones that apply, in this order:
   - **What we already have**: what exists today, including in older products.
   - **How it will work**: the process, with a flow strip or a diagram.
   - **What users see**: a mock or screenshot of the real UI.
   - **Safety / limits / good to know**: risks, things that can't be undone, guesses.
4. **Questions for the user**: one amber card. Number each question and keep counting across the conversation, so the
   user can answer "12 - not yet, 13 - yes". Each is one clear question line, then up to 3 short sentences, not
   bullets, that say what we are deciding, what will change, and why we are doing it. Then "👉 My pick: ...", so "go
   with your picks" is always a valid answer.
5. **Next steps**: what happens after the user answers.

## Pictures

| Content | Picture |
| --- | --- |
| A straight process | Flow strip of at most 4 steps, 2-3 word labels, so it fits on one line |
| How things connect: choices, branches, loops, systems, blockers, states | A diagram (see "Diagrams") |
| What users will see | A small mock of the actual UI (toast, button, menu) |
| A change you can see in the app | A real screenshot, cropped to the part that changed; before/after side by side |
| Two things kept apart | Two boxes with a red ✕ between them |
| Decisions | Numbered cards in a 2-column grid |
| Overall state | Status chips at the top |
| One key number | A big number with a one-line label, not a chart |
| A few numbers to compare | Horizontal bar chart (see "Charts") |
| A number changing over time | Line chart (see "Charts") |
| Options compared on a few traits | Small table: at most 4 columns and 6 rows, ✓ / ✕, the picked row highlighted |
| Something the user must run or paste | A code block (see "Code blocks") |
| Code the user asked to see | A short snippet or diff, at most 15 lines, file name as its label |

## Diagrams

Use a diagram when the point is how things connect, not how many.

| Content | Diagram |
| --- | --- |
| A choice with branches ("if this, then that") | Decision flow |
| A process with a branch, a loop or a retry | Flowchart (a straight process of 4 steps or fewer stays a flow strip) |
| What talks to what (Mac → storage → friends' apps) | System map: boxes and arrows |
| What waits on what | Blocker graph: each arrow goes from a blocker to what it blocks |
| Something that moves between states (downloading → ready → installed) | State diagram |
| Events in order, with dates | Timeline |

- The title says the takeaway ("Only updates signed with our key get installed"), not "Update flow".
- At most about 8 boxes. More: split it in two, or group boxes.
- Box labels of 2-4 words. A one-line explanation of each box shows on hover.
- One direction: top to bottom for decisions, left to right for processes and timelines.
- Decision flows: questions are amber boxes ending in "?", the answers (Yes / No) sit on the arrows, outcomes are
  plain boxes. The path we are on, or my pick, is in the accent colour with a thicker line; the other paths are muted.
- Status colours only with an icon or a word (✓ done, ⏸ waiting, ✕ blocked).
- One or two sentences under it: what to notice.
- Build it as inline SVG with a `viewBox` and `width: 100%`, styled by CSS classes that use the theme variables
  (`fill: var(--card)` in the `<style>`, not in SVG attributes). Text at least 14px at full size. No libraries needed.
- Preview it: no label spills out of its box, and no arrow crosses a label.

## Charts

Use a chart only when numbers are compared or change over time. If a `dataviz` skill is available, follow it for the
details; the short version:

- The title says the takeaway in plain words ("Each review round found fewer problems"), not "Fixes per round".
- Horizontal bars for comparing, sorted or in their natural order (rounds, days). A line for change over time. Parts
  of a whole: one stacked bar, never a pie.
- Values sit directly at the end of each bar or line. At most 5 series; one series needs no legend.
- One axis only. Light grid lines or none. Thin bars with rounded ends.
- Hovering a bar or point shows its exact value.
- Colours from the host's chart variables (`--chart-1` ...). Green, amber and red only mean good, warning and bad, and
  always come with an icon or a word.
- A fixed height (about 120-220px) so the chart doesn't stretch.

## Code blocks

Only when the user must run or paste something, or asked to see code.

- One line above it: what it does and where to run it ("In Terminal: saves the Apple login").
- One command per block, with a Copy button. The button also selects the whole command, because the visualizer's
  sandbox may block copying; if it does, the button says "Press ⌘C".
- Break long commands with `\` so nothing wraps in the middle of a word.
- One line below it: what they should see when it worked.
- Never put a secret in a block. Say "paste it into the hidden prompt" instead, and never ask for a secret in chat.
- Snippets and diffs: at most 15 lines, file name as a label, removed lines red and added lines green.

## Make it interactive

"Interactive visualizer" means the host's in-app visualizer used for what it's built for: dynamic experiences in the
thread that the user plays with, not a document with a few hovers. In T3 Code that's `html_render`, shipped in October
2026 as "in-app visualization capabilities ... cool dynamic experiences within the thread". Its demo was a map of the
codebase: click a folder to zoom in, switch what colour means, hover a row in the hot-files list and its box lights up.
Playing beats reading here: one step at a time, and the answer to "what if?" shows up instead of being explained. Use
one of these whenever it helps:

| When | Interaction |
| --- | --- |
| Lots of items (files, events, users, history) | Explore it: click to zoom in (Esc goes back), switch what colour or size means, hover a list row to light up the same item in the picture |
| Real data | Real charts drawn from it (SVG or canvas; a chart library from a CDN is fine), with hover values |
| How something works, step by step | Step-through: Back / Next (or click a step) walk one step at a time; the current step is highlighted and its 1-2 sentences show below |
| "What happens if ..." | What-if toggle or slider: flip it and the diagram, numbers or outcome change |
| Comparing options | Option switcher (tabs): the same layout for each option, so differences jump out; opens on my pick |
| A diagram with details | Click a box to show its 2-3 sentences under the diagram |
| A change you can see in the app | Before / after toggle |
| Exact values, technical terms | Hover or tap tooltips |
| Extra detail that isn't needed | A "More" fold (`<details>`) |

- The first view already works without a click: it opens on step 1, the usual path, or my pick. The crucial
  sentences, blockers, risks and questions are always visible, never behind a click or a hover.
- One main interaction per visual. Don't add controls nobody needs (search, filters, reset).
- Native buttons and inputs, so keyboard and touch work. Say the state in words ("Step 2 of 4").
- Things move only when the user acts: transitions under 200ms, none under `prefers-reduced-motion`.
- A static visual is fine when playing with it would add nothing.

## Showing a file

When the whole answer is a file the user asked to see (a skill, a `.md`, a config):

- First line: the file's clickable path and one short sentence (what it is; draft or in use).
- Then the file exactly as it is, in one fenced block tagged with its language (`markdown` for `.md`). Don't reword or
  summarize it.
- If the file itself contains code fences (three backticks), wrap it in a fence of four backticks so the block doesn't
  break.
- A long embedded block that doesn't help reading (a big HTML skeleton) may be swapped for a one-line placeholder;
  say so after the block.
- Never show a secret. If the file holds one, leave it out and say so.
- Last line: what the user can do next.
- If the file is only part of a bigger answer, use the visualizer and link the file instead.

## Writing rules

- Explain a technical term in a few plain words the first time ("feed" becomes "update list").
- Use concrete numbers. Mark guesses as "(my guess)".
- Say plainly what is done and what is not.
- Use they/them for people whose pronouns are unknown.

## Layout rules

- Font 16-17px, line height about 1.6, left aligned. No italics, no justified text.
- Cards: icon + bold title + 2-3 sentences. A secondary sentence in the muted colour.
- 2-column grid for pairs of short cards; full width for the process, diagrams, charts and questions. One column under
  ~600px.
- The questions card uses the warning colour so it stands out.
- Use the host's theme variables (`--card`, `--border`, `--muted-foreground`, `--warning-surface`, `--success`,
  `--primary`, `--chart-1`, `--code-background`, ...). No page background, no outer frame or banner title.
- Outside T3 Code, add the colour fallbacks block (see "HTML skeleton") exactly as it is. The page keeps the host's
  colours and T3 Code's layout.

## Hosts and exceptions

Use the row for where you're running. The visualizer differs per host, and so do the exceptions.

**In Codex, check first: app or CLI?** Only the Codex app puts a `~/.codex/visualizations/...` folder in your writable
roots. No such folder means the Codex CLI: build a browser page, and never send `visualize{...}`, because the terminal
can't show it.

| Where | Visualizer | Where it shows | Exceptions |
| --- | --- | --- | --- |
| T3 Code, with Claude or Codex | `html_render` (T3's in-app visualizer) | Inside the thread, above the reply | The page can't send a chat message or remember choices, so the user answers by typing. Codex's `visualize{...}` references and Claude Code's Artifact tool aren't available here |
| Codex app | The Visualize skill | Inside the conversation | None. A button can send the user's answer back. You're in the app when a `~/.codex/visualizations/` folder is in your writable roots |
| Codex CLI in a terminal | A browser page | Opens in the browser | Not in the chat: big answers only. Never send `visualize{...}` here: the terminal shows "Visualization unavailable on this device" |
| Claude Code app or web | The Artifact tool | A card with a link in the chat; the page opens in the browser | Not in the chat: big answers only |
| Claude Code in a terminal | The Artifact tool | A link (`/artifacts` lists them, ctrl+] reopens the latest) | Not in the chat: big answers only |
| Claude Code without the Artifact tool, or another agent that can run commands | A browser page | Opens in the browser | Not in the chat: big answers only |
| No visualizer, and no way to open a page | Markdown | In the chat | Diagrams as `mermaid` blocks where the chat draws them (T3 does), otherwise short arrow lines (`Signed? → Yes → Install`) |

**Big answers only:** where the visual opens outside the chat, opening it costs the user a click and a context switch.
Use it when the answer has 3 or more topics, a decision, or something to explore. Otherwise, give the same structure
in markdown in the chat: a heading with its icon per card, a ✓ / ○ / ⏸ status line, bold key phrases, tables, fenced
code blocks, and the numbered questions, each with its "👉 My pick".

- **T3 Code:** build one HTML page, check it with `html_preview` (fix wrapping and overflow), then show it with
  `html_render` before the chat reply. Frame height: the preview's `contentHeight`, at most 2000 (longer pages scroll
  inside the frame). Scripts, SVG and canvas run, chart libraries load from a CDN, and local images given as absolute
  paths are inlined (they can also carry packed data). Test every interaction before sending: add a temporary script
  that clicks the controls and logs what changed, read the console in `html_preview`, then remove the script.
- **Codex app:** follow the Visualize skill for the file and the `visualize{"path": ...}` line, and this skill for the
  content and the look; where they differ, the user's 2-3 sentence cards win. Build the page from this skill's
  skeleton and its classes, not Visualize's base classes. Write it as a fragment: drop `<!doctype>`, `<html>`,
  `<head>` and `<body>`, give `.wrap` a unique `id`, and put the colour fallbacks block at the top of its `<style>`.
  The page keeps Codex's colours, because the user wants T3 Code's layout in every host. Give each question a
  "Go with my pick" button that sends the answer with `window.openai.sendFollowUpMessage`.
- **Claude Code:** the Artifact tool publishes the page to a private claude.ai link. Build it from the skeleton with
  the colour fallbacks block; this skill's look replaces the Artifact tool's own design guidance (colours, fonts, layout).
  Update the same artifact for the same topic (pass its `url`) instead of making a new one each time. The user can
  comment on the page, and Claude can read and answer the comments. Say in one sentence what the page is, and don't
  paste the link or name a shortcut unless asked.
- **Browser page:** write the whole skeleton, with the colour fallbacks block, to
  `${TMPDIR:-/tmp}/im-monkey-brained/<topic>.html`, never into the user's project. Open it with `open` (macOS),
  `xdg-open` (Linux) or `start` (Windows). Codex's sandbox blocks this ("No application knows how to open URL"), so
  run the same `open` again outside the sandbox (escalated permissions); Codex asks the user to approve it. Only if
  it still can't open, give the same answer in markdown in the chat. If a headless browser is available, screenshot
  the page first and fix wrapping or overflow. In the chat, say in one sentence what the page is and give its path.

## HTML skeleton

The same page works in every host, with the same layout. In T3 Code, use it as it is. Everywhere else, put the colour
fallbacks block at the top of the `<style>`. It keeps the host's own colours and fills in the ones the host lacks, so
the page fits its chat.

```css
  /* Colour fallbacks: the host's own colours win; this fills in the ones it lacks. Leave this block out in T3 Code. */
  :where(:root) {
    color-scheme: light dark;
    --background: Canvas; --foreground: CanvasText;
    --card: color-mix(in srgb, CanvasText 4%, Canvas); --border: color-mix(in srgb, CanvasText 12%, Canvas);
    --secondary: color-mix(in srgb, CanvasText 6%, Canvas); --secondary-foreground: CanvasText;
    --muted-foreground: color-mix(in srgb, CanvasText 60%, Canvas);
    --primary: var(--blue, light-dark(#2563eb, #3b82f6)); --primary-foreground: #ffffff;
    --success: var(--green, #10b981); --warning: var(--orange, #f59e0b);
    --warning-surface: color-mix(in srgb, var(--warning) 15%, transparent);
    --destructive: var(--red, #ef4444); --destructive-surface: color-mix(in srgb, var(--destructive) 15%, transparent);
    --code-background: var(--muted, color-mix(in srgb, CanvasText 6%, Canvas)); --code-foreground: var(--foreground);
    --chart-1: var(--viz-series-1, var(--primary)); --chart-2: var(--viz-series-2, #14b8a6); --chart-3: var(--viz-series-3, #f59e0b);
    --chart-4: var(--viz-series-4, #a855f7); --chart-5: var(--viz-series-5, #f43f5e); --chart-6: var(--viz-series-6, #84cc16);
    --font-sans: system-ui, -apple-system, "Segoe UI", sans-serif; --font-mono: ui-monospace, Menlo, Consolas, monospace;
    --radius: 10px;
  }
  :root[data-theme="light"] { color-scheme: light; } :root[data-theme="dark"] { color-scheme: dark; }
  body { background: var(--background); color: var(--foreground); }
  @media (min-width: 800px) { body { margin: 0; padding: 32px 0; } .wrap { max-width: 760px; margin: 0 auto; } }
```

```html
<!doctype html><html><head><meta charset="utf-8"><style>
  body { font-family: var(--font-sans); font-size: 16px; line-height: 1.6; }
  button { font: inherit; }
  [hidden] { display: none !important; }
  .wrap { display: flex; flex-direction: column; gap: 14px; }
  .status { display: flex; gap: 10px; flex-wrap: wrap; }
  .chip { border-radius: 999px; padding: 6px 14px; font-weight: 600; border: 1px solid var(--border); background: var(--card); }
  .chip.ok { color: var(--success); } .chip.wait { color: var(--muted-foreground); }
  .chip.block { background: var(--warning-surface); color: var(--warning); border-color: transparent; }
  .grid { display: grid; grid-template-columns: 1fr 1fr; gap: 14px; }
  .card { background: var(--card); border: 1px solid var(--border); border-radius: var(--radius); padding: 18px; }
  .card h3 { margin: 0 0 8px; font-size: 17px; }
  .card p { margin: 0 0 6px; }
  .muted { color: var(--muted-foreground); }
  .term { border-bottom: 1px dotted var(--muted-foreground); cursor: help; }
  details summary { cursor: pointer; color: var(--muted-foreground); font-weight: 600; }
  .btn { font-weight: 600; font-size: 15px; padding: 4px 12px; border-radius: var(--radius); cursor: pointer;
         border: 1px solid var(--border); background: var(--secondary); color: var(--secondary-foreground); }
  .btn[aria-pressed="true"], .btn[aria-selected="true"] { background: var(--primary); color: var(--primary-foreground); border-color: transparent; }
  .flow, .tabs { display: flex; gap: 6px; align-items: center; flex-wrap: wrap; margin-bottom: 12px; }
  .nav { display: flex; gap: 12px; align-items: center; margin-top: 10px; }
  svg.dia { width: 100%; height: auto; display: block; margin: 4px 0 10px; }
  .dia rect { fill: var(--card); stroke: var(--border); stroke-width: 1.5; }
  .dia .q rect { fill: var(--warning-surface); stroke: var(--warning); }
  .dia .on rect { stroke: var(--primary); stroke-width: 3; }
  .dia text { fill: var(--foreground); font: 600 15px var(--font-sans); }
  .dia .lbl { fill: var(--muted-foreground); font-size: 13px; }
  .dia line { stroke: var(--muted-foreground); stroke-width: 1.5; }
  .dia line.on { stroke: var(--primary); stroke-width: 3; }
  .dia .head { fill: var(--muted-foreground); } .dia .head.on { fill: var(--primary); }
  .row { display: grid; grid-template-columns: 74px 1fr; align-items: center; gap: 10px; height: 30px; }
  .bar { height: 14px; background: var(--chart-1); border-radius: 0 4px 4px 0; }
  .code { position: relative; background: var(--code-background); color: var(--code-foreground); border-radius: var(--radius);
          padding: 12px 14px; font-family: var(--font-mono); font-size: 13px; white-space: pre; overflow-x: auto; }
  .cmd { user-select: all; }
  .copy { position: absolute; top: 8px; right: 8px; font: 600 12px var(--font-sans); padding: 4px 10px; cursor: pointer;
          border-radius: var(--radius); border: 1px solid var(--border); background: var(--card); color: var(--foreground); }
  .block { background: var(--warning-surface); border-color: transparent; }
  .block h3 { color: var(--warning); }
  .pick { font-weight: 700; color: var(--success); }
  @media (max-width: 600px) { .grid { grid-template-columns: 1fr; } }
  @media (prefers-reduced-motion: reduce) { * { transition: none !important; } }
</style></head><body><div class="wrap">
  <div class="status">
    <span class="chip ok">✓ Done thing</span>
    <span class="chip wait">○ Not done thing</span>
    <span class="chip block">⏸ Waiting on you</span>
  </div>

  <div class="card" id="steps">
    <h3>▶️ Takeaway as the title</h3>
    <div class="flow">
      <button class="btn" aria-pressed="true">Step 1</button> → <button class="btn" aria-pressed="false">Step 2</button> →
      <button class="btn" aria-pressed="false">Step 3</button>
    </div>
    <p class="now" aria-live="polite">What happens in step 1, with the <b>key fact</b>.</p>
    <div class="nav"><button class="btn back">← Back</button><span class="muted count">Step 1 of 3</span>
      <button class="btn next">Next →</button></div>
    <details><summary>More</summary><p class="muted">Extra detail with a <span class="term" title="Plain explanation">term</span>.</p></details>
  </div>

  <div class="card" id="opts">
    <h3>⚖️ Takeaway as the title</h3>
    <div class="tabs" role="tablist">
      <button class="btn" role="tab" aria-selected="true" data-tab="a">Option A · my pick</button>
      <button class="btn" role="tab" aria-selected="false" data-tab="b">Option B</button>
    </div>
    <div data-panel="a"><p>What Option A means for the user, and its <b>cost</b>.</p></div>
    <div data-panel="b" hidden><p>What Option B means for the user, and its <b>cost</b>.</p></div>
  </div>

  <div class="card">
    <h3>🔀 Takeaway as the diagram title</h3>
    <svg class="dia" viewBox="0 0 640 252" role="img" aria-label="Decision flow">
      <defs>
        <marker id="h" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="7" markerHeight="7" orient="auto"><path class="head" d="M0,0L10,5L0,10z"/></marker>
        <marker id="ho" viewBox="0 0 10 10" refX="9" refY="5" markerWidth="5" markerHeight="5" orient="auto"><path class="head on" d="M0,0L10,5L0,10z"/></marker>
      </defs>
      <g class="q on"><title>One line about this question</title><rect x="20" y="8" width="240" height="46" rx="10"/><text x="140" y="36" text-anchor="middle">First question?</text></g>
      <g><title>One line about this outcome</title><rect x="390" y="8" width="230" height="46" rx="10"/><text x="505" y="36" text-anchor="middle">Outcome A</text></g>
      <g class="q on"><title>One line about this question</title><rect x="20" y="102" width="240" height="46" rx="10"/><text x="140" y="130" text-anchor="middle">Second question?</text></g>
      <g class="on"><title>One line about this outcome</title><rect x="390" y="102" width="230" height="46" rx="10"/><text x="505" y="130" text-anchor="middle">Outcome B ✓</text></g>
      <g><title>One line about this outcome</title><rect x="20" y="196" width="240" height="46" rx="10"/><text x="140" y="224" text-anchor="middle">Outcome C</text></g>
      <line x1="260" y1="31" x2="386" y2="31" marker-end="url(#h)"/><text class="lbl" x="323" y="23" text-anchor="middle">Yes</text>
      <line class="on" x1="140" y1="54" x2="140" y2="98" marker-end="url(#ho)"/><text class="lbl" x="152" y="81">No</text>
      <line class="on" x1="260" y1="125" x2="386" y2="125" marker-end="url(#ho)"/><text class="lbl" x="323" y="117" text-anchor="middle">Yes</text>
      <line x1="140" y1="148" x2="140" y2="192" marker-end="url(#h)"/><text class="lbl" x="152" y="175">No</text>
    </svg>
    <p class="muted">What to notice, in one sentence. Hover a box for more.</p>
  </div>

  <div class="card">
    <h3>📊 Takeaway as the chart title</h3>
    <div class="row" title="Round 1: 9 fixes"><span class="muted">Round 1</span>
      <div style="display:flex;align-items:center;gap:8px"><div class="bar" style="width:60%"></div><b>9</b></div></div>
  </div>

  <div class="card">
    <p>In Terminal: what this does</p>
    <div class="code"><span class="cmd">command --flag value \
  --more value</span><button class="copy" onclick="copyCmd(this)">Copy</button></div>
    <p class="muted">You'll see: what success looks like</p>
  </div>

  <div class="card block">
    <h3>🚧 Questions for you</h3>
    <div class="grid">
      <div class="card"><b>1 · Question?</b><p class="muted">Why it matters, one line.</p><p class="pick">👉 My pick: ...</p></div>
    </div>
  </div>
</div>
<script>
  // Step-through: one or two sentences per step, in order.
  (() => {
    const root = document.getElementById('steps');
    const text = ['What happens in step 1, with the <b>key fact</b>.', 'What happens in step 2.', 'What happens in step 3.'];
    const steps = [...root.querySelectorAll('.flow .btn')];
    let at = 0;
    const show = (i) => {
      at = Math.max(0, Math.min(text.length - 1, i));
      steps.forEach((step, k) => step.setAttribute('aria-pressed', k === at));
      root.querySelector('.now').innerHTML = text[at];
      root.querySelector('.count').textContent = `Step ${at + 1} of ${text.length}`;
    };
    steps.forEach((step, k) => step.addEventListener('click', () => show(k)));
    root.querySelector('.back').addEventListener('click', () => show(at - 1));
    root.querySelector('.next').addEventListener('click', () => show(at + 1));
  })();

  // Option switcher: opens on my pick.
  (() => {
    const root = document.getElementById('opts');
    const tabs = root.querySelectorAll('[role=tab]');
    tabs.forEach((tab) => tab.addEventListener('click', () => {
      tabs.forEach((other) => other.setAttribute('aria-selected', other === tab));
      root.querySelectorAll('[data-panel]').forEach((panel) => { panel.hidden = panel.dataset.panel !== tab.dataset.tab; });
    }));
  })();

  // The sandbox may block copying, so the command is selected either way.
  function copyCmd(button) {
    const cmd = button.parentElement.querySelector('.cmd');
    getSelection().selectAllChildren(cmd);
    (navigator.clipboard ? navigator.clipboard.writeText(cmd.textContent) : Promise.reject())
      .then(() => { button.textContent = 'Copied ✓'; }, () => { button.textContent = 'Press ⌘C'; });
  }
</script>
</body></html>
```

## Checklist before sending

- [ ] The right format: the interactive visualizer, unless it's a one-liner, a file the user asked to see, or there's
      no visualizer.
- [ ] Outside T3 Code, the colour fallbacks block is in the page.
- [ ] Something to play with (step-through, what-if, option switcher) wherever it helps; it opens on step 1 or my pick.
- [ ] The user's own questions are answered in the first block.
- [ ] Every card has 2-3 sentences, not just labels.
- [ ] "What we already have" and the blockers are both covered, when they apply.
- [ ] No file paths, setting names or code unless asked, or unless the user must run it.
- [ ] Every question is numbered and has a pick.
- [ ] Guesses are marked.
- [ ] Numbers that are compared are a chart; a single key number is a big number.
- [ ] Diagrams: at most about 8 boxes, every label fits, the path we're on is highlighted.
- [ ] Nothing crucial is hidden behind a click or a hover.
- [ ] Every code block says what it does, has a Copy button, wraps nowhere mid-word and holds no secret.
- [ ] Previewed and every button tried: nothing wraps badly, flow strips fit on one line.
- [ ] The chat reply is 1-2 lines and does not repeat the page.
