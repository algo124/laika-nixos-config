# Hyprland (Tiling Window Manager) Configuration
{

wayland.windowManager.hyprland.enable = true; # Delete if not needed
home.sessionVariables.NIXOS_OZONE_WL = "1";
home.sessionVariables.WLR_NO_HARDWARE_CURSORS = "1";
wayland.windowManager.hyprland.settings = {
	exec-once = [
		"noctalia-shell --no-duplicate"
	];
	"$mod" = "SUPER"; # Set windows key as main modifier
	"$ipc" = "noctalia-shell ipc call";
	# BINDS
	bind = [
		"$mod, T, exec, alacritty"
		"$mod, W, exec, thunar"
		"$mod, E, exec, librewolf"
		"$mod, R, exec, $ipc launcher toggle"
		", F9, exec, grimblast copy area"
		"$mod, K, killactive"
		"$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
		"$mod, V, togglefloating"
		"$mod, left, movefocus, l"
		"$mod, right, movefocus, r"
		"$mod, up, movefocus, u"
		"$mod, down, movefocus, d"
		"$mod, 1, workspace, 1"
		"$mod, 2, workspace, 2"
		"$mod, 3, workspace, 3"
		"$mod, 4, workspace, 4"
		# Screenshots
		", PRINT, exec, hyprshot -m region -o ~/Pictures/Screenshots"
	] ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList (i:
        	let ws = i + 1;
            	in [
              		"$mod, code:1${toString i}, workspace, ${toString ws}"
              		"$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            	]
	)4));
	bindm = [
		"$mod, mouse:272, movewindow"
		"$mod, mouse:273, resizewindow"
	];
	bindel = [
		",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
		",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
		",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
		",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
		",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
		",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
	];
	# MONITOR
	monitor = "eDP-1, preferred, auto, 1";
	windowrule = [
		"opacity 0.9, match:class thunar"
		"opacity 0.95, match:class vesktop"
		"opacity 0.95, match:class element-desktop"
	];
};

# APPEARANCE AND MORE
wayland.windowManager.hyprland.extraConfig = "

general {
	gaps_in = 5
        gaps_out = 5
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)
	resize_on_border = true
}

decoration {
        rounding = 10
	rounding_power = 2
	shadow {
		enabled = true
		range = 4
		render_power = 3
		color = rgba(1a1a1aee)
	}
	blur {
		enabled = true
		size = 3
		passes = 1
		vibrancy = 0.1696
	}
}

animations {
	# CURVES
	bezier = easeOutQuint,   0.23, 1,    0.32, 1
	bezier = easeInOutCubic, 0.65, 0.05, 0.36, 1
	bezier = linear,         0,    0,    1,    1
	bezier = almostLinear,   0.5,  0.5,  0.75, 1
	bezier = quick,          0.15, 0,    0.1,  1

	# ANIMATIONS
	animation = global,        1,     10,    default
	animation = border,        1,     5.39,  easeOutQuint
	animation = windows,       1,     4.79,  easeOutQuint
	animation = windowsIn,     1,     4.1,   easeOutQuint, popin 87%
	animation = windowsOut,    1,     1.49,  linear,       popin 87%
	animation = fadeIn,        1,     1.73,  almostLinear
	animation = fadeOut,       1,     1.46,  almostLinear
	animation = fade,          1,     3.03,  quick
	animation = layers,        1,     3.81,  easeOutQuint
	animation = layersIn,      1,     4,     easeOutQuint, fade
	animation = layersOut,     1,     1.5,   linear,       fade
	animation = fadeLayersIn,  1,     1.79,  almostLinear
	animation = fadeLayersOut, 1,     1.39,  almostLinear
	animation = workspaces,    1,     1.94,  almostLinear, fade
	animation = workspacesIn,  1,     1.21,  almostLinear, fade
	animation = workspacesOut, 1,     1.94,  almostLinear, fade
	animation = zoomFactor,    1,     7,     quick
}

";

}
