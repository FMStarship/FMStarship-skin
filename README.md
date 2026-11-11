# FM Starship skin

A calm, dark, editorial skin for **Football Manager 27** (FM27). It's in early development, and nothing is ready to play with yet.

It's made by the same team as FM Starship, but it's a separate project: the skin doesn't need FM Starship, and FM Starship doesn't need the
skin.

## How FM27 skins work

FM27 loads skins itself. A skin is a folder in FM27's `skins` folder holding a `skin.json` and plain Unity stylesheets (USS), plus the skin's
own fonts and images. FM reads them while it runs, so there's no build step, no mod loader and no change to FM's own files.

```
skin/
├── skin.json     the manifest: name, version, and the list of stylesheets ("Sheets")
├── tokens.uss    the design tokens as USS variables (generated from design/tokens.json)
└── main.uss      the rules that apply the tokens to FM's interface
```

## Install (macOS)

```sh
scripts/install.sh
```

The script copies `skin/` to `~/Library/Application Support/Sports Interactive/Football Manager 27/skins/fm-starship/`. Then, in FM27, open
**Preferences > Interface > Skin** and choose **FM Starship**. The Skin choice only appears once FM has found at least one valid skin, so restart
FM if you don't see it.

- **To reload after a change,** switch to FM's default skin and back.
- **To remove the skin,** run `scripts/install.sh --uninstall`, then pick FM's default skin.
- **On Windows,** copy `skin/` by hand to `Documents\Sports Interactive\Football Manager 27\skins\fm-starship\`.

FM patches can change the interface the skin styles, so after each FM update, check the skin still looks right.

## Repository layout

| Path | What it holds |
| --- | --- |
| `skin/` | The skin folder, exactly as FM27 loads it |
| `design/tokens.json` | Colours, radii, spacing and type: the source for `skin/tokens.uss` and the Figma variables |
| `scripts/` | `build-tokens.py` (tokens.json → tokens.uss) and `install.sh` |
| `AGENTS.md` | Rules for anyone, human or agent, working in this repo |

## Licence

The skin is licensed under the [PolyForm Noncommercial License 1.0.0](LICENSE.md): you can use it, change it and share it for any
non-commercial purpose. It isn't open source.

The skin will bundle the [Inter](https://rsms.me/inter/) and [Libre Baskerville](https://fonts.google.com/specimen/Libre+Baskerville) fonts, which
are under the SIL Open Font License. Their licence files will ship alongside them.

Football Manager is a trademark of Sports Interactive and SEGA. This project isn't affiliated with them, and it contains none of their files.
