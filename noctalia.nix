{ pkgs, inputs, ... }: {

environment.systemPackages = with pkgs; [
	inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
];

home-manager.users.algo = {
	imports = [
		inputs.noctalia.homeModules.default
	];

	programs.noctalia-shell = {
		enable = true;
		settings = {
			bar = {
				density = "default";
				position = "top";
				floating = true;
				backgroundOpacity = 0.9;
				marginVertical = 5;
				marginHorizontal = 5;
				displayMode = "always_visible";
				showCapsule = false;
				frameRadius = 25;
				fontScale = 1.2;
				widgets = {
					left = [{
						id = "ControlCenter";
						useDistroLogo = true;
						enableColorization = true;
						colorizeDistroLogo = "tertiary";
					} {
						id = "Launcher";
					} {
						id = "Settings";
					} {
						id = "NotificationHistory";
					}];
					center = [{
						hideUnoccupied = false;
						id = "Workspace";
						labelMode = "none";
					}];
					right = [{
						id = "Volume";
					} {
						id = "Network";
					} {
						id = "Bluetooth";
					} {
						alwaysShowPercentage = false;
						id = "Battery";
						warningThreshold = 30;
					} {
						formatHorizontal = "HH:mm";
						formatVertical = "HH mm";
						id = "Clock";
						useMonospacedFont = true;
						usePrimaryColor = true;
					}];
				};
			};
			colorSchemes.predefinedScheme = "Catppuccin";
			general = {
				avatarImage = "~/Pictures/Icons/8bitDog.jpg";
				enableShadows = false;
				showScreenCorners = true;
				dimmerOpacity = 0;
				animationSpeed = 1.5;
				radiusRatio = 1.25;
				iRadiusRatio = 1.25;
				boxRadiusRatio = 1.25;
			};
			ui = {
				fontDefault = "Noto Sans";
				fontFixed = "Fira Code";
				panelBackgroundOpacity = 0.9;

			};
			location = {
				monthBeforeDay = true;
				name = "Portland, Oregon";
				use12hourFormat = true;
				firstDayOfWeek = 0;
				useFahrenheit = true;
			};
			wallpaper = {
				enabled = false;
			};
			appLauncher = {
				enableClipboardHistory = true;
				pinnedApps = [
					"librewolf"
					"alacritty"
					"element-desktop"
					"vesktop"
				];
			};
			dock = { enabled = false; };
			controlCenter = {
				shortcuts = {
			    		left = [{
						id = "Network";
			      		} {
						id = "Bluetooth";
			     		} {
						id = "NoctaliaPerformance";
			      		}];
			    		right = [{
						id = "Notifications";
			      		} {
						id = "PowerProfile";
					} {
						id = "KeepAwake";
			      		} {
						id = "NightLight";
					}];
				};
			};
		};
	};
};

}
