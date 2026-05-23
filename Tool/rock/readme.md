<br/>
<br/>
<br/>

<h3 align='center'>cluesurf/tool/rock</h3>
<p align='center'>
  Rock.app — headless, hackable terminal workspace system.
</p>

<br/>
<br/>

## Install

```bash
# 1. Add the tap
brew tap cluesurf/tool

# 2. Install Rock.app
brew install --cask cluesurf/tool/rock

# 3. Launch it
open -a Rock
```

The cask drops `Rock.app` into `/Applications`. Open it
like any macOS app, or via `open -a Rock` from the CLI.

## Usage

### Open the default workspace

```bash
open -a Rock
```

Or just click Rock.app in your Applications folder.

### Bind to a project (recommended)

For project-specific terminal workspaces (sidebar +
custom layout + named slabs):

```bash
cd ~/code/your-project
rock bind
```

`rock bind` scaffolds a `.rock/` folder in the project
with:

- `workspace.ts` — slab definitions (which commands run
  in which terminals)
- `layout.tsx` — JSX layout (where the terminals appear)
- `sidebar.tsx` — JSX sidebar (your navigation)

Then:

```bash
rock open    # or just `rock`
```

opens the project workspace in Rock.app.

### Daily usage

| Command | What |
|---|---|
| `rock` | Open the current project's workspace |
| `rock open` | Same as above |
| `rock list slabs` | List running terminals |
| `rock spawn <name>` | Spawn a slab inline (no GUI) |
| `rock call <command>` | Call a named command from `.rock/commands.ts` |
| `rock send <slab> <text>` | Send keystrokes to a slab |
| `rock focus <slab>` | Activate a slab in the open window |
| `rock kill <slab>` | Terminate a slab |
| `rock doctor` | Health check |

### What rock is

A headless, hackable terminal workspace **library + desktop
app**. You compose primitives (`<Nest>`, `<Slab>`, `<Dock>`,
`<Tree>`, `<Bar>`, `<Palette>`) into a custom terminal
experience for your project.

Source + full documentation:
https://github.com/cluesurf/rock

## Updating

```bash
brew upgrade cluesurf/tool/rock
```

Or wait for the in-app auto-update notification.

## Uninstall

```bash
brew uninstall --cask cluesurf/tool/rock
brew uninstall --zap --cask cluesurf/tool/rock   # also clears ~/.rock + prefs
```

## Related

- Cask formula: [`../../Casks/rock.rb`](../../Casks/rock.rb)
- Rock source + docs: [github.com/cluesurf/rock](https://github.com/cluesurf/rock)
