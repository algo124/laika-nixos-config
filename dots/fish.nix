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
		conf = "cd ~/.config && eza";
		daw = "pw-jack reaper & disown";
		dots = "cd /etc/nixos && eza";
		ff = "fastfetch";
		rb = "sudo reboot -f";
		rebuild = "sudo nixos-rebuild switch";
		sd = "shutdown now";
		show-dots = "sudo nvim -p * dots/*";
		upgrade = "sudo nix flake update && sudo nixos-rebuild switch";
	};
};

}
