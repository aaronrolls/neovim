return {
	"SmiteshP/nvim-gps",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-gps").setup()
	end
}
