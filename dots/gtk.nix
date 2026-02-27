# GTK Configuration
{ pkgs, ... }: {

gtk = {
	enable = true;
	theme = {
		name = "catppuccin-mocha-pink-standard";
		package = pkgs.catppuccin-gtk.override {
			accents = ["pink"];
			variant = "mocha";
		};
	};
	iconTheme = {
		name = "Papirus";
		package = pkgs.catppuccin-papirus-folders.override {
   			flavor = "mocha";
    			accent = "pink";
  		};
	};
	cursorTheme = {
        	name = "catppuccin-mocha-pink-cursors";
        	package = pkgs.catppuccin-cursors.mochaPink;
        	size = 24;
      	};
};

}
