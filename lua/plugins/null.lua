return {
	"jose-elias-alvarez/null-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.stylua,
			},
		})
		vim.cmd("map <Leader>lf :lua vim.lsp.buf.format({timeout_ms = 10000})<CR>")
		vim.cmd("map <Leader>lF :lua vim.lsp.buf.range_formatting()<CR>")
	end,
}
