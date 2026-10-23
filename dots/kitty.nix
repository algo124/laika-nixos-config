# Kitty and starship config for terminal
{lib, config, mods,...}: {
programs.kitty = {
	enable = true;
	font.name = "Fira Code";
        font.size = 12;
	themeFile = "rose-pine";
	settings = {
		enable_audio_bell = false;
		scrollback_lines = 10000;
		window_padding_width = 2;
		background_opacity = "0.7";
                cursor = "#ffffff";
	};
};

programs.starship = {
        enable = true;
        settings.add_newline = false;
        settings.character = {
                success_symbol = "[❯](purple)";
                error_symbol = "[❯](red)";
                vimcmd_symbol = "[❮](green)";
        };
        # settings = fromTOML(builtins.readFile ./pastel-powerline.toml) // {};
        settings.format = "$username\$hostname\$localip\$shlvl\$singularity\$kubernetes\$nats\$directory\$vcsh\$fossil_branch\$fossil_metrics\$git_branch\$git_commit\$git_state\$git_metrics\$git_status\$hg_branch\$hg_state\$pijul_channel\$docker_context\$package\$bun\$c\$cmake\$cobol\$cpp\$daml\$dart\$deno\$dotnet\$elixir\$elm\$erlang\$fennel\$fortran\$gleam\$golang\$gradle\$haskell\$haxe\$helm\$java\$julia\$kotlin\$lua\$maven\$mojo\$nim\$nodejs\$ocaml\$odin\$opa\$perl\$php\$pulumi\$purescript\$python\$quarto\$raku\$rlang\$red\$ruby\$rust\$scala\$solidity\$swift\$terraform\$typst\$vlang\$vagrant\$xmake\$zig\$buf\$guix_shell\$nix_shell\$conda\$pixi\$meson\$spack\$memory_usage\$aws\$gcloud\$openstack\$azure\$direnv\$env_var\$mise\$crystal\$custom\$sudo\$cmd_duration\$jobs\$battery\$time\$status\$container\$netns\$os\$shell\$character"; # Removed line break
};

}
