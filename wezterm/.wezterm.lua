local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-startup", function()
	local tab, pane, window = mux.spawn_window({})
	window:gui_window():toggle_fullscreen()
end)

local customColorScheme = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
customColorScheme.brights = {
	"#585b70",
	"#f38ba8",
	"#a6e3a1",
	"#f9e2af",
	"#89b4fa",
	"#f5c2e7",
	"#94e2d5",
	"#ffffff",
}

return {
	-- default_prog = { "tmux" },
	disable_default_key_bindings = true,
	color_schemes = {
		["Catppuccin Mocha Ext"] = customColorScheme,
	},
	color_scheme = "Catppuccin Mocha Ext",
	enable_tab_bar = false,
	font_size = 12.0,
	-- macos_window_background_blur = 40,
	-- macos_window_background_blur = 30,

	-- window_background_image = '/Users/omerhamerman/Downloads/3840x1080-Wallpaper-041.jpg',
	-- window_background_image_hsb = {
	-- 	brightness = 0.01,
	-- 	hue = 1.0,
	-- 	saturation = 0.5,
	-- },

	window_background_opacity = 0.95,
	-- win32_system_backdrop = "Acrylic",
	-- win32_acrylic_accent_color = "#A7C7E7",
	-- window_background_opacity = 1.0,
	-- window_background_opacity = 0.78,
	-- window_background_opacity = 0.20,
	window_decorations = "NONE",

	initial_rows = 42,
	initial_cols = 160,

	background = {
		{
			source = {
				Gradient = {
					colors = { "#000000" },
				},
			},
			width = "100%",
			height = "100%",
			opacity = 0.75,
		},
		{
			source = { File = { path = "/home/djlie98/dotfiles/wezterm/rose_thorn.png" } },
			height = "Cover",
			width = "Cover",
			horizontal_align = "Center",
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
			opacity = 0.2,
		},
		{
			source = {
				File = {
					path = "/home/djlie98/dotfiles/wezterm/blob_blue.gif",
					speed = 1,
				},
			},
			repeat_x = "NoRepeat",
			repeat_y = "NoRepeat",
			vertical_align = "Middle",
			width = "100%",
			height = "Cover",
			opacity = 0.10,
			hsb = {
				hue = 0.9,
				saturation = 0.8,
				brightness = 0.1,
			},
		},
	},

	window_padding = {
		left = 24,
		right = 24,
		top = 24,
		bottom = 24,
	},

	keys = {
		{
			key = "f",
			mods = "CTRL",
			action = wezterm.action.ToggleFullScreen,
		},
		-- paste from the clipboard
		{ key = "v", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },

		-- paste from the primary selection
		{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("PrimarySelection") },
		{ key = "PageUp", mods = "SHIFT", action = wezterm.action.ScrollByPage(-1) },
		{ key = "PageDown", mods = "SHIFT", action = wezterm.action.ScrollByPage(1) },
		{ key = "UpArrow", mods = "SHIFT", action = wezterm.action.ScrollByLine(-1) },
		{ key = "DownArrow", mods = "SHIFT", action = wezterm.action.ScrollByLine(1) },
	},

	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "CTRL",
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},
}
