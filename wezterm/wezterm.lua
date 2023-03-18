local wezterm = require("wezterm")
local act = wezterm.action

return {
	color_scheme = "tokyonight",
	window_background_opacity = 0.97,
	inactive_pane_hsb = {
		saturation = 0.9,
		brightness = 0.8,
	},
	font = wezterm.font("JetBrainsMono Nerd Font"),
	font_size = 12.0,
	keys = {
		{
			key = "p",
			mods = "CTRL",
			action = act.ActivateKeyTable({
				name = "pane_manager",
				one_shot = false,
			}),
		},
	},
	key_tables = {
		pane_manager = {
			-- Creation
			{ key = "s",      action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
			{ key = "v",      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

			-- Close
			{ key = "q",      action = act.CloseCurrentPane({ confirm = false }) },

			-- Selection
			{ key = "S",      action = act.PaneSelect },

			-- Resizing
			{ key = "h",      action = act.AdjustPaneSize({ "Left", 1 }) },
			{ key = "l",      action = act.AdjustPaneSize({ "Right", 1 }) },
			{ key = "k",      action = act.AdjustPaneSize({ "Up", 1 }) },
			{ key = "j",      action = act.AdjustPaneSize({ "Down", 1 }) },

			-- Cancel the mode
			{ key = "Escape", action = "PopKeyTable" },
		},
	},
}
