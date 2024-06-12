local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- for windows
config.default_domain = 'WSL:Ubuntu'
config.default_prog = {"/usr/bin/env", "zsh", "-l", "-c", "exec /usr/bin/env zsh"}

-- theme
config.color_scheme = 'Kanagawa (Gogh)'
config.font = wezterm.font("UDEV Gothic 35NFLG Regular")
config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true
config.use_ime = true
config.window_close_confirmation = 'AlwaysPrompt'
config.enable_scroll_bar = true
config.initial_rows = 36
config.initial_cols = 120
config.default_cursor_style = 'BlinkingUnderline'

return config
