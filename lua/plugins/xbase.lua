return {
	'xbase-lab/xbase',
	run = "make install",
	dependencies = { 
  		"nvim-lua/plenary.nvim",
      		"nvim-telescope/telescope.nvim",
      		"neovim/nvim-lspconfig"
    	},
    	config = function()
      		require'xbase'.setup({})  -- see default configuration bellow
    	end
}
