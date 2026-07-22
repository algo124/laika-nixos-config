# Hjem (Home Manager Alternative) Config
# I use this to configure some programs (such as Hyprland) more easily.
# This file is called from flake.nix
{
hjem.clobberByDefault = true;
hjem.users.algo = {
	directory = "/home/algo";
	files = {
		".config/fastfetch/config.jsonc".source = ./dots/fastfetch.jsonc;
		".config/hypr/hyprland.lua".source = ./dots/hyprland.lua;
		".config/hypr/hyprpaper.conf".source = ./dots/hyprpaper.conf;
	};
};
}
