-- Hyprland Configuration file.

-- Monitor configuration.
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

-- Environment variables.
hl.env("XCURSOR_THEME", "DMZ-White")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_THEME", "DMZ-White")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("MOZ_DBUS_REMOTE", "1")
hl.env("MOZ_DISABLE_RDD_SANDBOX", "1")
hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("HYPRSHOT_DIR", os.getenv("HOME") .. "/Pictures/screenshots")

-- Default programs i use.
local terminal = "kitty"
local menu = "~/.local/libexec/menu"
local browser = "zen-browser"
local fileManager = terminal .. " -o window_padding_width='0 0 0 0' -e yazi"

-- Autoexec programs.
hl.on("hyprland.start", function()
	hl.exec_cmd(
		"bash -c 'dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE; systemctl --user start hyprland-session.target'"
	)
	hl.exec_cmd("hyprpaper")
	hl.exec_cmd("waybar -c ~/.config/waybar/config.jsonc")
	hl.exec_cmd("nvibrant 0 0 0 818")
	hl.exec_cmd(terminal, { workspace = "1 silent" })
	hl.exec_cmd(browser)
	hl.exec_cmd("gtk-launch zen.webapp-3d2d2c3a-3d12-4ef6-af79-4cfa14017caa.desktop")
	hl.exec_cmd("gtk-launch zen.webapp-3d0e37d8-2840-4b3a-8b49-02fdf12e2ac0.desktop")
end)

-- Workspace rules.
hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 12, gaps_in = 6 })
hl.workspace_rule({ workspace = "f[1]", gaps_out = 12, gaps_in = 6 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 8 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 8 })

-- Opacity overrides.
hl.window_rule({ match = { class = "zen" }, opacity = "1.0 override" })

-- Main Zen window goes to workspace 2. This must be a persistent window rule,
-- not an exec rule: exec rules are applied after window rules, override them and
-- are consumed by the first window of the process (all Zen windows share one PID).
hl.window_rule({ match = { class = "zen" }, workspace = "2 silent" })

-- Scratchpad rules: force each app into its special workspace.
-- NOTE: exec `workspace = "..."` does NOT work here: gtk-launch exits
-- immediately and zen-bin reuses the main Zen PID (see `hyprctl clients`),
-- so the token never sticks. windowrule by class does.
hl.window_rule({
	match = { class = "zen.webapp-3d2d2c3a-3d12-4ef6-af79-4cfa14017caa" },
	workspace = "special:chat silent",
	border_size = 1,
	border_color = "rgba(a1deeaff)",
	opacity = "1.0 override",
})
hl.window_rule({
	match = { class = "zen.webapp-3d0e37d8-2840-4b3a-8b49-02fdf12e2ac0" },
	workspace = "special:music silent",
	border_size = 1,
	border_color = "rgba(a1deeaff)",
	opacity = "1.0 override",
})

-- Binds.
local mainMod = "SUPER"

hl.bind("mouse:276", hl.dsp.focus({ workspace = "-1" }))
hl.bind("mouse:275", hl.dsp.focus({ workspace = "+1" }))

-- Waybar toggle. Shows/hides gaps and borders depending on waybar status.
local waybar_visible = true
hl.bind(mainMod .. " + GRAVE", function()
	hl.dispatch(hl.dsp.exec_cmd("~/.local/libexec/toggle-waybar"))
	waybar_visible = not waybar_visible
	if waybar_visible then
		-- Waybar visible: use normal gaps, border, and rounding.
		hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 12, gaps_in = 6 })
		hl.workspace_rule({ workspace = "f[1]", gaps_out = 12, gaps_in = 6 })
		hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
		hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 8 })
		hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
		hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 8 })
	else
		-- Waybar hidden: use no gaps, border, or rounding.
		hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
		hl.workspace_rule({ workspace = "f[1]", gaps_out = 0, gaps_in = 0 })
		hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, border_size = 0 })
		hl.window_rule({ match = { float = false, workspace = "w[tv1]" }, rounding = 0 })
		hl.window_rule({ match = { float = false, workspace = "f[1]" }, border_size = 0 })
		hl.window_rule({ match = { float = false, workspace = "f[1]" }, rounding = 0 })
	end
end)

hl.bind(mainMod .. " + A", hl.dsp.workspace.toggle_special("chat"))
hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"))

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("DEV_ENV=~/personal/dev ~/personal/dev/dev-env"))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exit())

hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))

hl.bind(mainMod .. " + PRINT", hl.dsp.exec_cmd("hyprshot -m region"))
hl.bind(mainMod .. " + PAUSE", hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(mainMod .. " + SCROLL_LOCK", hl.dsp.exec_cmd("hyprshot -m output"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + W", hl.dsp.window.cycle_next())

hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, function()
		-- Read the special workspace BEFORE switching: if the compositor ever
		-- auto-hides specials on workspace change, this still sees it and closes it.
		local sp = hl.get_active_special_workspace()
		hl.dispatch(hl.dsp.focus({ workspace = i }))
		if sp ~= nil then
			hl.dispatch(hl.dsp.workspace.toggle_special((sp.name:gsub("^special:", ""))))
		end
	end)
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Requires playerctl.
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Looks and feel.
hl.config({
	general = {
		gaps_in = 6,
		gaps_out = 12,
		border_size = 1,
		col = {
			active_border = "rgba(a1deeaff)",
			inactive_border = "rgba(a1deea00)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},

	decoration = {
		rounding = 8,
		active_opacity = 0.97, -- transparency 0.98 when active
		inactive_opacity = 0.97,

		shadow = {
			enabled = false,
			range = 4,
			render_power = 3,
			color = "rgba(1b1b1bee)",
		},

		blur = {
			enabled = false,
			size = 3,
			passes = 1,
			vibrancy = 0.1696,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.curve("out", { type = "bezier", points = { { 0.22, 0.8 }, { 0.2, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "out" })

hl.animation({ leaf = "windowsIn", enabled = true, speed = 3.5, bezier = "out", style = "popin 96%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "out", style = "popin 96%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3.5, bezier = "out" })

hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "out", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 3, bezier = "out", style = "slidefade 20%" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 3, bezier = "out", style = "slidefade 20%" })

hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "out" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 3, bezier = "out" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 2.5, bezier = "out" })

hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "out", style = "fade" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "out", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 2.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3, bezier = "out" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 2.5, bezier = "out" })

hl.animation({ leaf = "border", enabled = true, speed = 4, bezier = "out" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 4, bezier = "out" })

-- Misc.
hl.config({
	dwindle = {
		preserve_split = true,
	},

	master = {
		new_status = "master",
	},

	scrolling = {
		fullscreen_on_one_column = true,
	},

	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},

	input = {
		kb_layout = "us, latam",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",

		accel_profile = "flat",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = false,
		},
	},
})
