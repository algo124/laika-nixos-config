# Noctalia V5 setup for Laika, called from flake.nix
{ inputs, ... }: {
home-manager.users.algo = {
	imports = [
      		inputs.noctalia.homeModules.default
    	];

	programs.noctalia = {
      		enable = true;
      		settings = {
        		theme = {
          			mode = "dark";
          			source = "builtin";
          			builtin = "Catppuccin";
        		};
			wallpaper = {
				enabled = true;
				directory = "~/Pictures/Wallpaper";
			};
			wallpaper.default = {
				path = "~/Pictures/Wallpaper/rainbow-guys.png";
			};
			shell = {
				avatar_path = "~/Pictures/Icons/8bitDog.jpg";
				time_format = "{:%-I:%M %p}";
				date_format = "{:%A}, {:%Y-%m-%d}";
			};
			shell.screenshot = {
				directory = "~/Pictures/Screenshots";
				copy_to_clipboard = true;
			};
			bar.main = {
				thickness = 30;
				scale = 1.1;
				margin_ends = 0;
				padding = 5;
				radius_top_left = 0;
				radius_top_right = 0;
				shadow = false;
				start = [
					"control-center"
					"notifications"
					"clipboard"
					"wallpaper"
					"launcher"
				];
				center = [ "workspaces" ];
				end = [ 
					"network"
					"bluetooth"
					"volume"
					"brightness"
					"battery"
					"clock"
					"session"
				];
			};
			location = {
				address = "Portland, OR";
			};
			widget.control-center = {
				glyph = "star";
				custom_image = "~/Pictures/Icons/nix-snowflake-white.svg";
			};
			widget.launcher = {
				glyph = "rocket";
			};
			widget.clock = {
				format = "{:%Y-%m-%d}, {:%-I:%M %p}";
			};
			widget.volume = {
				show_label = false;
			};
			widget.battery = {
				show_label = false;
			};
			widget.brightness = {
				show_label = false;
			};
			widget.network = {
				show_label = false;
			};
		};
	};
};

}
