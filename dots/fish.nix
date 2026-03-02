# Fish (Shell) Configuration
{

programs.fish = {
	enable = true;
	interactiveShellInit = "set fish_greeting"; # Disable greeting
	shellAbbrs = {
		v = "nvim";
	};
	functions = {
		clean = "sudo nix-collect-garbage && nix-store --optimise -vv";
		dots = "cd /etc/nixos && eza";
		ff = "fastfetch";
		reboot = "sudo reboot -f";
		rebuild = "sudo nixos-rebuild switch";
		show-dots = "sudo nvim -p *.nix dots/*.nix";
	};
};

}
