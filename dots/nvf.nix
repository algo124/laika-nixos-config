# Nvf and Neovim config
{pkgs, lib, ...}: {
programs.nvf = {
	enable = true;
    	settings.vim = {
      		viAlias = false;
      		vimAlias = true;
      		lsp.enable = true;
		lineNumberMode = "number";
                theme = {
                        enable = true;
                        name = "rose-pine";
                        style = "main";
                        transparent = true;
                };
		lazy.enable = true;
                notes.obsidian.enable = true;
                notes.obsidian.setupOpts = {
                        workspaces = [{
                                name = "Atlas";
                                path = "/home/algo/Atlas";
                        }];
                        ui.enable = true;
                        attachments.folder = "🌅 Atlas/Attachments";
                        legacy_commands = false;
                };
                globals.vim_markdown_folding_disable = 1;
                options.foldmethod = "manual";
                options.foldlevelstart = 99;
                options.conceallevel = 2;
                utility = {
                        snacks-nvim = {
                                enable = true;
                                setupOpts = {
                                        bigfile.enable = true;
                                        image.enabled = true;
                                        image.doc.inline = false;
                                        explorer.enabled = true;
                                        picker.enabled = true;
                                        dashboard.enabled = true;
                                        dashboard.preset.header =
                                                "
                                                                                                                                
           ▄▄▄▄                                                 ██              
           ▀▀██                                                 ▀▀              
  ▄█████▄    ██       ▄███▄██   ▄████▄   ██▄████▄  ██▄  ▄██   ████     ████▄██▄ 
  ▀ ▄▄▄██    ██      ██▀  ▀██  ██▀  ▀██  ██▀   ██   ██  ██      ██     ██ ██ ██ 
 ▄██▀▀▀██    ██      ██    ██  ██    ██  ██    ██   ▀█▄▄█▀      ██     ██ ██ ██ 
 ██▄▄▄███    ██▄▄▄   ▀██▄▄███  ▀██▄▄██▀  ██    ██    ████    ▄▄▄██▄▄▄  ██ ██ ██ 
  ▀▀▀▀ ▀▀     ▀▀▀▀    ▄▀▀▀ ██    ▀▀▀▀    ▀▀    ▀▀     ▀▀     ▀▀▀▀▀▀▀▀  ▀▀ ▀▀ ▀▀ 
                      ▀████▀▀                                                   

                                                ";
                                        dashboard.preset.keys = [
                                                { icon = " "; key = "f"; desc = "Find File"; action = ":lua Snacks.picker.files({cwd='/', exclude={'/nix', '/var'}})";}
                                                { icon = " "; key = "g"; desc = "Find Text"; action = ":lua Snacks.picker.grep({cwd='/', exclude={'/nix', '/var'}})";}
                                                { icon = " "; key = "n"; desc = "New File"; action = ":ene | startinsert";}
                                                { icon = " "; key = "r"; desc = "Recent Files"; action = ":lua Snacks.dashboard.pick('oldfiles')";}
                                                { icon = "󰟃"; key = "d"; desc = "Dots"; action = ":lua Snacks.picker.files({cwd='/etc/nixos'})";}
                                                { icon = " "; key = "c"; desc = "Config"; action = ":lua Snacks.picker.files({cwd = '~/.config'})";}
                                                { icon = " "; key = "a"; desc = "Atlas"; action = ":lua Snacks.picker.files({cwd = '~/Atlas'})";}
                                                { icon = " "; key = "q"; desc = "Quit"; action = ":qa!"; }
                                        ];
                                        dashboard.sections = [
                                                { section="header"; }
                                                { section="keys"; gap = 1; padding = 1;}
                                        ];
                                };
                        };
                };
        };
};
}
