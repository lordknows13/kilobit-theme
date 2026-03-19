local wezterm = require 'wezterm'
local act = wezterm.action

local data_dir = wezterm.home_dir .. '/.config/wezterm'
local globals_path = data_dir .. '/globals.lua'
local themes_path  = data_dir .. '/theme.lua'

local globals = dofile(globals_path)
local themes  = dofile(themes_path)

wezterm.add_to_config_reload_watch_list(globals_path)

local function active_theme()
  return globals.preview_theme or globals.current_theme
end

----------------------------------------------------------------------
-- LIVE PREVIEW THEME SWITCHER (fzf in split pane)
----------------------------------------------------------------------

local function theme_switcher(window, pane)
  window:perform_action(
    act.SplitPane {
      direction = 'Right',
      size = { Percent = 30 },
      command = {
        args = {
          '/bin/bash', '-c',
          string.format([[
export PATH="/usr/local/bin:/opt/homebrew/bin:$PATH"
WEZTERM_DIR="%s"
LUA=$(command -v lua)
FZF=$(command -v fzf)

CURRENT_THEME=$($LUA -e "
  local g = dofile('$WEZTERM_DIR/globals.lua')
  print(g.current_theme)
")

THEME_LIST=$($LUA -e "
  local t = dofile('$WEZTERM_DIR/theme.lua')
  for _, v in ipairs(t) do print(v) end
")

SELECTED=$(echo "$THEME_LIST" | $FZF --reverse --exact \
  --prompt="Theme (current: $CURRENT_THEME) > " \
  --bind "focus:execute-silent:sleep 0.01; $LUA $WEZTERM_DIR/scripts/preview_theme.lua {}")

if [ -n "$SELECTED" ]; then
  $LUA "$WEZTERM_DIR/scripts/apply_theme.lua" "$SELECTED"
else
  $LUA "$WEZTERM_DIR/scripts/cancel_theme.lua"
fi

echo "restore" > /tmp/wezterm_restore_state
          ]], data_dir),
        },
      },
    },
    pane
  )
end

----------------------------------------------------------------------
-- WATCHERS
----------------------------------------------------------------------

wezterm.on('update-status', function(window, pane)
  local f1 = io.open('/tmp/wezterm_trigger_theme_switcher', 'r')
  if f1 then
    f1:close()
    os.remove('/tmp/wezterm_trigger_theme_switcher')
    theme_switcher(window, pane)
    return
  end

  local f2 = io.open('/tmp/wezterm_restore_state', 'r')
  if f2 then
    f2:close()
    os.remove('/tmp/wezterm_restore_state')
  end
end)

----------------------------------------------------------------------
-- CUSTOM SCHEMES
----------------------------------------------------------------------

local custom_schemes = {
  ['kilobit'] = {
    foreground = '#eeffff',
    background = '#050508',
    cursor_bg = '#ffffff',
    cursor_border = '#ffffff',
    cursor_fg = '#bfbfbf',
    selection_bg = '#eeffff',
    selection_fg = '#545454',
    ansi = { '#000000', '#ff5370', '#c3e88d', '#ffcb6b', '#82aaff', '#c792ea', '#89ddff', '#ffffff' },
    brights = { '#545454', '#ff5370', '#c3e88d', '#ffcb6b', '#82aaff', '#c792ea', '#89ddff', '#ffffff' },
  },
}

----------------------------------------------------------------------
-- MAIN CONFIG
----------------------------------------------------------------------

return {
  color_schemes = custom_schemes,
  color_scheme = active_theme(),
  window_background_opacity = 0.85,
  window_close_confirmation = 'NeverPrompt',

  initial_cols = 120,
  initial_rows = 30,
  adjust_window_size_when_changing_font_size = false,

  window_decorations = 'RESIZE',

  font = wezterm.font_with_fallback({
    { family = 'JetBrainsMono Nerd Font', weight = 'Bold' },
    { family = 'Menlo' },
    { family = 'Monaco' },
  }),
  font_size = 14,

  default_cursor_style = 'BlinkingBlock',
  cursor_blink_rate = 200,
  cursor_blink_ease_in = 'Constant',
  cursor_blink_ease_out = 'Constant',
  hide_mouse_cursor_when_typing = false,

  scrollback_lines = 10000,
  animation_fps = 1,
  mouse_wheel_scrolls_tabs = false,

  enable_tab_bar = true,
  hide_tab_bar_if_only_one_tab = true,
  tab_bar_at_bottom = true,
  use_fancy_tab_bar = false,

  default_prog = { '/bin/zsh', '-l', '-c', 'fastfetch; exec zsh -l' },

  window_padding = { left = 4, right = 4, top = 4, bottom = 4 },

  keys = {
    {
      key = 'T',
      mods = 'CTRL|SHIFT',
      action = wezterm.action_callback(theme_switcher),
    },
    { key = 'i', mods = 'ALT', action = act.IncreaseFontSize },
    { key = 'o', mods = 'ALT', action = act.DecreaseFontSize },
    { key = '0', mods = 'CMD', action = act.ResetFontSize },
    { key = 'c', mods = 'CMD', action = act.CopyTo 'Clipboard' },
    { key = 'v', mods = 'CMD', action = act.PasteFrom 'Clipboard' },
    { key = 't', mods = 'CMD', action = act.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { '/bin/zsh', '-l', '-c', 'fastfetch; exec zsh -l' },
    } },
    { key = 'LeftArrow', mods = 'CMD', action = act.ActivateTabRelative(-1) },
    { key = 'RightArrow', mods = 'CMD', action = act.ActivateTabRelative(1) },
    { key = 'w', mods = 'CMD', action = act.CloseCurrentTab { confirm = false } },
    { key = 'Enter', mods = 'CMD|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    { key = ']', mods = 'CMD', action = act.ActivatePaneDirection 'Next' },
    { key = '[', mods = 'CMD', action = act.ActivatePaneDirection 'Prev' },
    { key = 'f', mods = 'CMD', action = act.Search { CaseInSensitiveString = '' } },
    { key = 'n', mods = 'CMD|SHIFT', action = act.SpawnWindow },
  },
}
