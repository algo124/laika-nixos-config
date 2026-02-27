{ config, lib, pkgs, ... }: {

boot.loader = {
	systemd-boot.enable = true;
	systemd-boot.configurationLimit = 3;
	efi.canTouchEfiVariables = true;
};

networking.hostName = "laika";
networking.networkmanager.enable = true;
# Allows easy connection to public wifi.
networking.resolvconf.dnsExtensionMechanism = false;
hardware.bluetooth.enable = true;
services.power-profiles-daemon.enable = true;
services.upower.enable = true;

time.timeZone = "America/Los_Angeles";

i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
	LC_ALL = "en_US.UTF-8";
};  

services.pipewire = {
	enable = true;
	pulse.enable = true;
	alsa.enable = true;
	jack.enable = true;
};

services.syncthing = {
	enable = true;
	openDefaultPorts = true;
	group = "users";
	user = "algo";
	dataDir = "/home/algo";
};

system.stateVersion = "25.11";

services.journald.extraConfig = "SystemMaxUse=100M";
services.libinput.enable = true;

programs.fish.enable = true;

users.users.algo = {
  	isNormalUser = true;
	extraGroups = [ "wheel" "audio" "networkmanager" ];
	packages = with pkgs; [ tree ];
	shell = pkgs.fish;
	useDefaultShell = true;
};

nixpkgs.config.allowUnfree = true;
# nix.settings.experimental-features = [ "nix-command" "flakes" ];

services.displayManager.sddm = {
	enable = true;
	wayland.enable = true;
	theme = "catppuccin-mocha-pink";
	settings.Theme.CursorTheme = "catppuccin-mocha-pink-cursors";
	settings.Theme.CursorSize = "24";
};

programs.hyprland = {
	enable = true;
	withUWSM = true;
	xwayland.enable = true;
};


programs.thunar.enable = true;
programs.thunar.plugins = with pkgs; [
	thunar-archive-plugin
	thunar-volman
];

# Thunar extensions
services = {
	gvfs.enable = true;
	tumbler.enable = true;
};

fonts.packages = with pkgs; [ 
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-color-emoji
	liberation_ttf
	fira-code
	fira-code-symbols
];

environment.systemPackages = with pkgs; [
	# Basics
	vim neovim
	wget
	fastfetch
	openssh
	git gh
	unzip
	toybox # Unix Command Line Utils
	ffmpeg
	dbus
	dunst
	xdg-desktop-portal
	xdg-desktop-portal-gtk
	wl-clipboard cliphist
	brightnessctl
	playerctl
	imagemagick
	meh
	catppuccinifier-cli
	electron
	# Applications
	vlc
	alacritty
	thunar
	librewolf
	zoom-us
	element-desktop
	vesktop
	libreoffice-qt
	bitwarden-desktop
	obsidian # May need --disable-gpu
	shotwell
	# Sound
	pwvucontrol
	wireplumber
	qpwgraph
	# Appearance
	(pkgs.catppuccin-sddm.override {
		flavor = "mocha";
		accent = "pink";
	})
	catppuccin-cursors.mochaPink
	hyprpaper
	hyprpolkitagent
	hyprshot
];

}

