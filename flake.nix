{
description = "Core NixOS flake for Laika";

inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	home-manager = {
		url = "github:nix-community/home-manager";
		# Avoids version conflicts between home-manager and nixpkgs.
		inputs.nixpkgs.follows = "nixpkgs";
	};
	noctalia = {
      		url = "github:noctalia-dev/noctalia-shell";
      		inputs.nixpkgs.follows = "nixpkgs";
    	};
};

outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
	nixosConfigurations.laika = nixpkgs.lib.nixosSystem {
		specialArgs = { inherit inputs; };
		modules = [
			./configuration.nix
			./hardware-configuration.nix
			./noctalia.nix
			home-manager.nixosModules.home-manager {
            			home-manager.useGlobalPkgs = true;
            			home-manager.useUserPackages = true;
				home-manager.backupFileExtension = "bkp";
				home-manager.overwriteBackup = true;
				home-manager.users.algo = ./home.nix;
			}
		];
	};
};

}

