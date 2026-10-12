# Nvf and Neovim config
{
programs.nvf = {
	enable = true;
    	settings = {
      		vim.viAlias = false;
      		vim.vimAlias = true;
      		vim.lsp = { enable = true; };
		preventJunkFiles = true;
		vim.lineNumberMode = "number";

		lazy = {
			enable = true;
		};
    	};
};
}
