local w = require("wezterm")

local config = {}

if w.config_builder then
	config = w.config_builder()
end

config = {
	-- font
	font = w.font("SFMono Nerd Font"),
	font_size = 18.0,

	-- theme
	color_scheme = "OneHalfDark",
	-- force_reverse_video_cursor = true,
	colors = {
		background = "#1B1D22",
	},

	-- tab bar
	enable_tab_bar = false,

	-- hide titlebar
	window_decorations = "RESIZE",

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	enable_kitty_graphics = true,

	max_fps = 120,
}

return config
