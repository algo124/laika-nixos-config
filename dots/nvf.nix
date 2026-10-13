# Nvf and Neovim config
{pkgs, lib, ...}: {

programs.nvf = {
	enable = true;
    	settings.vim = {
      		viAlias = false;
      		vimAlias = true;
      		lsp = { enable = true; };
		lineNumberMode = "number";
                theme = {
                        enable = true;
                        name = "catppuccin";
                        style = "mocha";
                        transparent = true;
                };
		lazy.enable = true;
                notes.obsidian.enable = true;
                notes.obsidian.setupOpts = {
                        workspaces = [{
                                name = "Atlas";
                                path = "~/Atlas";
                        }];
                        attachments.folder = "🌅 Atlas/Attachments";
                        legacy_commands = false;
                };
                globals.vim_markdown_folding_disable = 1;
                utility = {
                        snacks-nvim = {
                                enable = true;
                                setupOpts = {
                                        bigfile.enable = true;
                                        image.enabled = true;
                                        picker.enabled = true;
                                };
                        };
                };
                dashboard.dashboard-nvim = {
                        enable = true;
                        setupOpts = {
                                config.header = [
                                        
                                ];
                        };
                };
    	};
};
}
