return {
	"SmiteshP/nvim-navic",
	dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
	config = function()
		require("nvim-navic").setup()
	end
}
