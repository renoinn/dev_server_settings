local wezterm = require 'wezterm'

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- for windows
config.default_domain = 'WSL:Ubuntu'
config.default_prog = {"/usr/bin/env", "zsh", "-l", "-c", "exec /usr/bin/env zsh"}

-- theme
local scheme = wezterm.get_builtin_color_schemes()["nord"]
config.color_scheme = 'Kanagawa (Gogh)'
config.font = wezterm.font("UDEV Gothic 35NFLG Regular")
config.font_size = 14
config.use_fancy_tab_bar = false
config.colors = {
		tab_bar = {
			background = scheme.background,
			new_tab = { bg_color = "#2e3440", fg_color = scheme.ansi[8], intensity = "Bold" },
			new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
			-- format-tab-title
			-- active_tab = { bg_color = "#121212", fg_color = "#FCE8C3" },
			-- inactive_tab = { bg_color = scheme.background, fg_color = "#FCE8C3" },
			-- inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
		},
	}
config.exit_behavior = "CloseOnCleanExit"
config.tab_bar_at_bottom = false

config.hide_tab_bar_if_only_one_tab = true
config.use_ime = true
config.window_close_confirmation = 'AlwaysPrompt'
config.enable_scroll_bar = true
config.initial_rows = 36
config.initial_cols = 120
config.default_cursor_style = 'BlinkingUnderline'

-- actions
local act = wezterm.action

config.leader = { key = 'Space', mods = 'CTRL', timeout_milliseconds = 2000 }
config.keys = {
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  { key = 'c', mods = 'CTRL', action = act.CopyTo 'ClipboardAndPrimarySelection' },
  {
    key = "<",
    mods = "SHIFT|CTRL",
    action = act.SplitPane {
      direction = "Down",
      size = { Percent = 30 },
      command = {
        domain = 'CurrentPaneDomain'
      }
    },
  },
  {
    key = ">",
    mods = "SHIFT|CTRL",
    action = act.CloseCurrentPane { confirm = false },
  },
  {
    key = 'h',
    mods = "LEADER",
    action = act.ActivatePaneDirection 'Left',
  },
  {
    key = 'j',
    mods = "LEADER",
    action = act.ActivatePaneDirection 'Down',
  },
  {
    key = 'k',
    mods = "LEADER",
    action = act.ActivatePaneDirection 'Up',
  },
  {
    key = 'l',
    mods = "LEADER",
    action = act.ActivatePaneDirection 'Right',
  },
  {
    key = 'r',
    mods = 'LEADER',
    action = act.ActivateKeyTable {
      name = 'resize_pane',
      one_shot = false,
    },
  },
}

config.key_tables = {
  -- Defines the keys that are active in our resize-pane mode.
  -- Since we're likely to want to make multiple adjustments,
  -- we made the activation one_shot=false. We therefore need
  -- to define a key assignment for getting out of this mode.
  -- 'resize_pane' here corresponds to the name="resize_pane" in
  -- the key assignments above.
  resize_pane = {
    { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
    { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

    { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
    { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

    { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
    { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

    { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
    { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

    -- Cancel the mode by pressing escape
    { key = 'Escape', action = 'PopKeyTable' },
    { key = '[', mods = 'CTRL', action = 'PopKeyTable' },
  },

  -- Defines the keys that are active in our activate-pane mode.
  -- 'activate_pane' here corresponds to the name="activate_pane" in
  -- the key assignments above.
  -- activate_pane = {
  --   { key = 'LeftArrow', action = act.ActivatePaneDirection 'Left' },
  --   { key = 'h', action = act.ActivatePaneDirection 'Left' },
  --
  --   { key = 'RightArrow', action = act.ActivatePaneDirection 'Right' },
  --   { key = 'l', action = act.ActivatePaneDirection 'Right' },
  --
  --   { key = 'UpArrow', action = act.ActivatePaneDirection 'Up' },
  --   { key = 'k', action = act.ActivatePaneDirection 'Up' },
  --
  --   { key = 'DownArrow', action = act.ActivatePaneDirection 'Down' },
  --   { key = 'j', action = act.ActivatePaneDirection 'Down' },
  -- },
}

return config
