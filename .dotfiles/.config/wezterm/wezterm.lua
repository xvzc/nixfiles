local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.term = "wezterm"

config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_rate = 0
config.default_cursor_style = "SteadyBlock"

config.audible_bell = "Disabled"

config.window_background_opacity = 0.93
config.colors = require("themes/miami")

wezterm.on("window-resized", function(window, pane)
	local dimensions = window:get_dimensions()
	local overrides = window:get_config_overrides() or {}

	overrides.window_padding = {
		left = dimensions.is_full_screen and 0 or 6,
		right = 0,
		top = 0,
		bottom = 0,
	}

	window:set_config_overrides(overrides)
end)

config.font_size = 12.0

config.font = wezterm.font_with_fallback({
	"JetBrainsMonoNL Nerd Font",
	"D2Coding Nerd Font",
})

config.keys = {
	{ key = "L", mods = "CTRL", action = wezterm.action.ShowDebugOverlay },

	{
		key = "-",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "=",
		mods = "CTRL",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	-- Send "CTRL-A" to the terminal when pressing CTRL-A, CTRL-A
	{
		key = "=",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
	{
		key = "Tab",
		mods = "CTRL",
		-- action = wezterm.action.SendKey({ key = "Tab", mods = "CTRL" }),
		action = wezterm.action.SendString('\x1b[9;5u'),
	},
	{
		key = "Tab",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SendKey({ key = "Tab", mods = "SHIFT|CTRL" }),
	},
}
-- ^[[9;5u ^[[1;5Z

return config
