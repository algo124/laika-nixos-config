{
description = "Core NixOS flake for Laika";

inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	catppuccin.url = "github:catppuccin/nix";
	hjem = {
      		url = "github:feel-co/hjem";
      		inputs.nixpkgs.follows = "nixpkgs";
    	};	
	home-manager = {
		url = "github:nix-community/home-manager";
		# Avoids version conflicts between home-manager and nixpkgs.
		inputs.nixpkgs.follows = "nixpkgs";
	};
	hyprland.url = "github:hyprwm/Hyprland";
	musnix = { url = "github:musnix/musnix"; };
	noctalia = {
      		url = "github:noctalia-dev/noctalia/legacy-v4"; # Change once V5 hits repos
      		inputs.nixpkgs.follows = "nixpkgs";
    	};
};

outputs = inputs@{ self, nixpkgs, catppuccin, home-manager, ... }: {
	nixosConfigurations.laika = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			./configuration.nix
			./hardware-configuration.nix
			./noctalia.nix
			inputs.musnix.nixosModules.musnix
			inputs.hjem.nixosModules.default
			./hjem.nix
			catppuccin.nixosModules.catppuccin {
				catppuccin.autoEnable = true;
				catppuccin.enable = true;
				catppuccin.flavor = "mocha";
				catppuccin.accent = "pink";
			}
			home-manager.nixosModules.home-manager {
            			home-manager.useGlobalPkgs = true;
            			home-manager.useUserPackages = true;
				home-manager.backupFileExtension = "bkp";
				home-manager.overwriteBackup = true;
				home-manager.users.algo = {
					imports = [ ./home.nix ];
				};
			}
		];
	};
};

}

