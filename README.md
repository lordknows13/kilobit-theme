# Kilobit Theme

Custom macOS desktop setup -- Ghostty terminal, SketchyBar status bar, Yabai tiling window manager, and Fastfetch system info.

## What's Included

### Ghostty
- **Kilobit color scheme** -- dark background (`#050508`) with Material-inspired syntax colors
- **Material Dark Black** custom theme
- JetBrainsMono Nerd Font, semi-transparent window, hidden titlebar
- Fastfetch on launch in every new window

### SketchyBar
- Floating bar with transparent background and rounded bracket sections
- Apple logo + workspace indicators (1-9) on the left
- Front app icon display using sketchybar-app-font with 70+ app mappings
- Clock, date, battery, and volume on the right
- FiraCode Nerd Font Mono for icons and labels

### Yabai
- BSP tiling layout with cmd as mouse modifier
- Integrated with SketchyBar for dynamic top padding
- Float rules for System Settings, Calculator, Karabiner, Activity Monitor, Finder dialogs
- Auto-reloads SketchyBar on system wake

### Fastfetch
- Custom config with clean layout and color circles
- Custom logo image

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

## Installation

### Dependencies

```bash
brew install fastfetch sketchybar yabai jq
brew install --cask font-jetbrains-mono-nerd-font font-fira-code-nerd-font ghostty
# sketchybar-app-font: https://github.com/kvndrsslr/sketchybar-app-font
```

### Setup

```bash
git clone https://github.com/lordknows13/kilobit-theme.git ~/kilobit-theme
cd ~/kilobit-theme

# Ghostty
mkdir -p ~/.config/ghostty/themes
cp ghostty/config ~/.config/ghostty/config
cp ghostty/themes/material-dark-black ~/.config/ghostty/themes/

# SketchyBar
mkdir -p ~/.config/sketchybar/plugins
cp sketchybar/sketchybarrc ~/.config/sketchybar/sketchybarrc
cp sketchybar/icon_map.sh ~/.config/sketchybar/icon_map.sh
cp sketchybar/plugins/*.sh ~/.config/sketchybar/plugins/
chmod +x ~/.config/sketchybar/plugins/*.sh ~/.config/sketchybar/icon_map.sh

# Yabai
cp yabai/.yabairc ~/.yabairc
chmod +x ~/.yabairc

# Fastfetch
mkdir -p ~/.config/fastfetch
cp fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc
cp fastfetch/logo.png ~/.config/fastfetch/logo.png

# Start services
sketchybar --reload
yabai --restart-service
```

## License

MIT
