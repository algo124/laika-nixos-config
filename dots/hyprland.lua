-- Laika Laptop hyprland.lua config

-- Monitor
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

-- Program name setting
local terminal    = "alacritty"
local fileManager = "thunar"

-- Catppuccin Color Setting
local pink = "rgb(f5c2e7)"

-- Autostart
hl.on("hyprland.start", function () 
	hl.exec_cmd("hyprpaper") -- loads in quickly
	hl.exec_cmd("noctalia")
end)

-- Environment Variables
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Appearance
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 5,
        border_size = 1,
        col = {
            active_border   = { colors = { pink, "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity   = 1.0,
        inactive_opacity = 1.0,
        shadow = {
        	enabled = true,
        	range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
    animations = { enabled = true, },
})

-- Default Curves and Animations
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.23, 1},    {0.32, 1}    } })
hl.curve("easeInOutCubic", { type = "bezier", points = { {0.65, 0.05}, {0.36, 1}    } })
hl.curve("linear",         { type = "bezier", points = { {0, 0},       {1, 1}       } })
hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })
hl.curve("easy", { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })
hl.animation({ leaf = "global", enabled = true,  speed = 5,   bezier = "default" })

-- Disable Hyprland Defaults
hl.config({
    misc = {
        force_default_wallpaper = 1,
        disable_hyprland_logo   = true,
    },
})

-- Inputs
hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Hotkeys
local mainMod = "SUPER"
local ipc = "noctalia msg "

-- My Binds
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("element-desktop"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("librewolf"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("pw-jack reaper"))
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Y", hl.dsp.exec_cmd(ipc .. "panel-toggle launcher"))
hl.bind(mainMod .. " + U", hl.dsp.exec_cmd("euphonica"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("ytmdesktop"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("vesktop"))
hl.bind("F9", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))
hl.bind("F10", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))
hl.bind("ALT + Tab", hl.dsp.exec_cmd(ipc .. "window-switcher"))

local closeWindowBind = hl.bind(mainMod .. " + K", hl.dsp.window.kill())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true }) -- mainMod + right click

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- Default Window Rules
local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- Custom Window Rules
hl.window_rule({ match = { class = "dev.noctalia.Noctalia" }, float = true, })

-- Opacity Rules
hl.window_rule({ match = { class = "thunar" }, opacity = "0.8",})
hl.window_rule({ match = { class = "vesktop" }, opacity = "0.9",})
hl.window_rule({ match = { class = "element" }, opacity = "0.9",})
hl.window_rule({ match = { class = "REAPER" }, opacity = "0.9",})
hl.window_rule({match = { class = "youtube-music-desktop-app" }, opacity = "0.9",})

-- Reaper Rules
hl.window_rule({ match = { class = "REAPER", title = "Confirmation" }, center = true, })
hl.window_rule({ match = { class = "yabridge-host.exe" }, no_max_size = true, opacity = "1",})

-- Workspace Rules
hl.workspace_rule({ workspace = "1", monitor = "", persistent = true })
hl.workspace_rule({ workspace = "2", monitor = "", persistent = true })
hl.workspace_rule({ workspace = "3", monitor = "", persistent = true })
hl.workspace_rule({ workspace = "4", monitor = "", persistent = true })
hl.workspace_rule({ workspace = "5", monitor = "", persistent = true })

-- Start on Workspace 1
hl.on("hyprland.start", function () hl.dispatch(hl.dsp.focus({ workspace = "1" })) end)
