# Working in this repo

This is the FM Starship skin for Football Manager 27: plain USS, our own fonts and images, loaded by FM27's built-in skin loader. Read
`README.md` for the layout and how to install.

## Original work only

Never commit or ship any of these:
- Sports Interactive's files, or anything extracted from them: their bundles, USS, icons, backgrounds or fonts (including the licensed
  league and competition fonts);
- code decompiled or disassembled from FM;
- interface dumps of FM;
- real player photos, club badges or competition logos.

Only our own USS, our own art and OFL-licensed fonts (with their licence files) go in. Referring to FM's element names, class names and
variable names in our selectors is fine: that's how a skin targets FM.

If you use a third-party tool or template, check its licence first and credit it in the README.

## Football Manager's folders

- You may read FM's app, bundles and logs, but never change them.
- Write only to FM27's `skins/fm-starship/` folder, and only with the person's agreement (`scripts/install.sh` does exactly that).
- Never touch saves, preferences, `games/` or anything else under `~/Library/Application Support/Sports Interactive/`.
- Don't start, quit or kill FM unless the person asks. Before a test that starts or quits FM, check the shared lock
  `~/Developer/.fm-in-use`:
  - if it's missing, write one line, `<who> · <why> · <date time>`, and delete it once FM is quit again;
  - if someone else holds it, wait.

## Skin conventions

- `design/tokens.json` is the single source for colours, sizes and fonts. Regenerate `skin/tokens.uss` with `scripts/build-tokens.py`.
  Never edit `tokens.uss` by hand.
- Our variables are prefixed `--fms-` so they never collide with FM's own.
- In `main.uss`, use `var(--fms-...)` rather than literal values.
- `skin.json` lists its sheets under `"Sheets"` (capital S), as plain paths relative to the skin folder.
- Some of FM's colours are set from code (competition and club colours, for example), and USS can't override those. Note them rather than
  fighting them.
- Every FM patch can change class names. After a patch, check the skin in FM before anything else.

## Git

- Work on a branch and open a pull request. Never push to `main`; the person merges.
- Ask before the first push of a branch, and before anything public: a PR, issue, release or post.
- Never put personal details in commits, web searches or any outside request.
