# Kitty config
{
programs.kitty = {
	enable = true;
	font.name = "Fira Code";
        font.size = 12;
	themeFile = "Catppuccin-Mocha";
	settings = {
		enable_audio_bell = false;
		scrollback_lines = 10000;
		window_padding_width = 2;
		background_opacity = "0.8";
	};
};

}
