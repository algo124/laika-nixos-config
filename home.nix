# Home.nix holds home-manager imports
{ ... }: {

home.stateVersion = "25.11";
home.username = "algo";
home.homeDirectory = "/home/algo";

xdg.enable = true;

wayland.windowManager.hyprland.systemd.enable = false;

imports = [
	./dots/alacritty.nix
	./dots/cliphist.nix
	./dots/fish.nix
	./dots/git.nix
	./dots/gtk.nix
	./dots/hyprland.nix
	./dots/hyprpaper.nix
	./dots/librewolf.nix
	./dots/mpd.nix
];

}

