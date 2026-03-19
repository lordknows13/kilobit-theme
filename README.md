# Kilobit Theme

Custom terminal setup — WezTerm config with interactive theme switcher, custom Kilobit color scheme, and fastfetch greeting.

## What's Included

### WezTerm
- **Kilobit color scheme** — dark background (`#050508`) with Material-inspired syntax colors
- **Interactive theme switcher** — `Ctrl+Shift+T` opens an fzf picker with 316 themes and live preview
- **JetBrainsMono Nerd Font**, opacity, keybindings, and tab config
- **Fastfetch on launch** — every new tab/window shows system info

### Fastfetch
- Custom config with clean layout and color circles
- Custom logo image

## Installation

### macOS

```bash
# Install dependencies
brew install wezterm fastfetch fzf lua

# Install font
brew install --cask font-jetbrains-mono-nerd-font

# Clone and install
git clone https://github.com/lordknows13/kilobit-theme.git /tmp/kilobit-theme
cp /tmp/kilobit-theme/wezterm/.wezterm.lua ~/.wezterm.lua
mkdir -p ~/.config/wezterm/scripts ~/.config/fastfetch
cp /tmp/kilobit-theme/wezterm/globals.lua ~/.config/wezterm/globals.lua
cp /tmp/kilobit-theme/wezterm/theme.lua ~/.config/wezterm/theme.lua
cp /tmp/kilobit-theme/wezterm/scripts/*.lua ~/.config/wezterm/scripts/
cp /tmp/kilobit-theme/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
cp /tmp/kilobit-theme/fastfetch/logo.png ~/.config/fastfetch/logo.png
rm -rf /tmp/kilobit-theme
echo "Done. Restart WezTerm."
```

### Windows (PowerShell)

```powershell
# Install dependencies (requires scoop or winget)
winget install wez.wezterm
scoop install fastfetch fzf lua

# Install font — download JetBrainsMono Nerd Font from:
# https://github.com/ryanoasis/nerd-fonts/releases/latest

# Clone and install
git clone https://github.com/lordknows13/kilobit-theme.git $env:TEMP\kilobit-theme
Copy-Item "$env:TEMP\kilobit-theme\wezterm\.wezterm.lua" "$env:USERPROFILE\.wezterm.lua"
New-Item -ItemType Directory -Force -Path "$env:USERPROFILE\.config\wezterm\scripts", "$env:USERPROFILE\.config\fastfetch" | Out-Null
Copy-Item "$env:TEMP\kilobit-theme\wezterm\globals.lua" "$env:USERPROFILE\.config\wezterm\"
Copy-Item "$env:TEMP\kilobit-theme\wezterm\theme.lua" "$env:USERPROFILE\.config\wezterm\"
Copy-Item "$env:TEMP\kilobit-theme\wezterm\scripts\*.lua" "$env:USERPROFILE\.config\wezterm\scripts\"
Copy-Item "$env:TEMP\kilobit-theme\fastfetch\config.jsonc" "$env:USERPROFILE\.config\fastfetch\"
Copy-Item "$env:TEMP\kilobit-theme\fastfetch\logo.png" "$env:USERPROFILE\.config\fastfetch\"
Remove-Item -Recurse -Force "$env:TEMP\kilobit-theme"
Write-Host "Done. Restart WezTerm."
```

## Kilobit Color Scheme

| Color     | Hex       |
|-----------|-----------|
| Background | `#050508` |
| Foreground | `#eeffff` |
| Cursor     | `#ffffff` |
| Red        | `#ff5370` |
| Green      | `#c3e88d` |
| Yellow     | `#ffcb6b` |
| Blue       | `#82aaff` |
| Magenta    | `#c792ea` |
| Cyan       | `#89ddff` |

## Theme Switcher

Press `Ctrl+Shift+T` to open the theme picker. It opens an fzf pane on the right with live preview — themes apply as you scroll through them. Press Enter to confirm or Escape to cancel.

## License

MIT
