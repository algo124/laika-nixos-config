# Home.nix holds home-manager imports
{ ... }: {

home.stateVersion = "25.11";
home.username = "algo";
home.homeDirectory = "/home/algo";

xdg.enable = true;

wayland.windowManager.hyprland.systemd.enable = false;

imports = [
	./dots/cliphist.nix
	./dots/fish.nix
	./dots/git.nix
	./dots/gtk.nix
	./dots/kitty.nix
	./dots/librewolf.nix
	./dots/mpd.nix
	./dots/mpdscribble.nix
	./dots/nvf.nix
];

}

