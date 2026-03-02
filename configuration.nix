{ config, lib, pkgs, ... }:

let

# reaper-wrapped script credit to Man2 of the NixOS Discord.
# Gets Reaper plugins like spectral-compressor working
reaper-wrapped = pkgs.symlinkJoin {
	name = "reaper-wrapped";
	paths = [ pkgs.reaper ];
	buildInputs = [ pkgs.makeWrapper ];
	postBuild = ''
		wrapProgram $out/bin/reaper \
		--prefix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath [
			pkgs.libxcb
			pkgs.xcbutilwm
			pkgs.libX11
			pkgs.libXcursor
			pkgs.libXrandr
			pkgs.libGL
		]}
	'';
};

in

{

boot.loader = {
	systemd-boot.enable = true;
	systemd-boot.configurationLimit = 3;
	efi.canTouchEfiVariables = true;
};

# Networking
networking.hostName = "laika";
networking.networkmanager.enable = true;
hardware.bluetooth.enable = true;
# Allows easy connection to public wifi.
networking.wireless.enable = true;
networking.resolvconf.dnsExtensionMechanism = false;
networking.wireless.userControlled = true;

# Power
services.power-profiles-daemon.enable = true;
services.upower.enable = true;

time.timeZone = "America/Los_Angeles";

i18n.defaultLocale = "en_US.UTF-8";
i18n.extraLocaleSettings = {
	LC_ALL = "en_US.UTF-8";
};  

# Sound
services.pipewire = {
	enable = true;
	pulse.enable = true;
	alsa.enable = true;
	jack.enable = true;
};

# Syncthing
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
musnix.enable = true;

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

# Thunar
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

# Thunar to Use Alacritty
xdg.terminal-exec = {
	enable = true;
	settings = {
		default = [ "alacritty.desktop" ];
	};
};

# Neovim
programs.neovim = {
	enable = true;
	defaultEditor = true;
};

# Fonts
fonts.packages = with pkgs; [ 
	noto-fonts
	noto-fonts-cjk-sans
	noto-fonts-color-emoji
	liberation_ttf
	fira-code
	fira-code-symbols
];

# Environment Variables
environment.variables = {
	EDITOR = "nvim";
	TERMINAL = "alacritty";
	BROWSER = "librewolf";
};

# Packages
environment.systemPackages = with pkgs; [
	# Command Line Tools
	nano vim
	wget
	fastfetch # alias: ff
	ripgrep # command: rg
	bat # cat alt
	eza # ls alt
	openssh
	git gh # git & git cli
	unzip
	toybox # Unix Command Line Utils
	ffmpeg
	dbus
	dunst
	wl-clipboard cliphist
	brightnessctl playerctl
	imagemagick
	meh
	dxvk # DXVK setup script
	catppuccinifier-cli
	# Programming Languages + Packages
	python313
	python313Packages.dbus-python
	# Basics
	electron
	xdg-desktop-portal
	xdg-desktop-portal-gtk
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
	# Theme
	(pkgs.catppuccin-sddm.override {
		flavor = "mocha";
		accent = "pink";
	})
	catppuccin-cursors.mochaPink
	# Hyprland
	hyprpaper hyprpolkitagent hyprshot
	# KDE Packages
	kdePackages.ktorrent
	kdePackages.kdenlive
	# Sound & Musicking
	pwvucontrol wireplumber qpwgraph
	euphonica nicotine-plus # Soulseek client
	winetricks wineWow64Packages.yabridge
	yabridge yabridgectl
	alsa-lib alsa-utils
	reaper-wrapped
	# Music Plugins
	decent-sampler surge-xt plugdata vital
	airwindows-lv2 chow-tape-model
];

}

