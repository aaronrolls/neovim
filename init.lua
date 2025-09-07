
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require("config.lazy")

local opt = vim.opt
vim.cmd("colorscheme carbonfox")
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.breakindent = true

opt.undofile = true
opt.undodir = vim.fn.expand("~/.nvim/undo/")

opt.backup = true
opt.backupdir = vim.fn.expand("~/.nvim/backup/")

opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.signcolumn = "yes"
opt.hidden = true
opt.cursorline = true

vim.cmd([[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
    ]])

--[[
vim.lsp.config["luals"] = {
	cmd = {"lua-language-server"},
	filetypes = {"lua"},
}
vim.lsp.enable("luals")

vim.lsp.config["rustls"] = {
	cmd = {"rust-analyzer"},
	filetypes = {"rust", "rs"},
}
vim.lsp.enable("rustls")
]]
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Normal Mode
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)
keymap("n", "<Leader>ft", "<cmd>NvimTreeToggle<cr>", default_opts)
keymap("n", "<Leader>yy", '"+yy', default_opts)
keymap("n", "<Leader>p", '"+p', default_opts)
keymap("n", "<Leader>P", '"+P', default_opts)
keymap("n", "<Leader>dd", '"+dd', default_opts)
keymap("n", "<Leader>fd", "<cmd>Dash<cr>", default_opts)
keymap("t", "<C-`>", "<C-\\><C-n><Leader>;", default_opts)
keymap("n", "<Leader>nh", "<cmd>nohl<cr>", default_opts)
keymap("i", "jk", "<esc>", default_opts)
keymap("n", "<leader>=", "<C-a>", default_opts)
keymap("n", "<leader>-", "<C-x>", default_opts)

-- split window control
keymap("n", "<leader>sv", "<C-w>v", default_opts)
keymap("n", "<leader>sh", "<C-w>s", default_opts)
keymap("n", "<leader>se", "<C-w>=", default_opts)
keymap("n", "<leader>sx", "<cmd>close<cr>", default_opts)

-- tab control
keymap("n", "<leader>to", "<cmd>tabnew<cr>", default_opts)
keymap("n", "<leader>tx", "<cmd>tabclose<cr>", default_opts)
keymap("n", "<leader>tn", "<cmd>tabn<cr>", default_opts)
keymap("n", "<leader>tp", "<cmd>tabp<cr>", default_opts)


-- Visaul Mode
keymap("v", "<Leader>y", '"+y', default_opts)
keymap("v", "<Leader>d", '"+d', default_opts)
-- LSP Diagnostics Options Setup
local sign = function(opts)
	vim.fn.sign_define(opts.name, {
		texthl = opts.name,
		text = opts.text,
		numhl = "",
	})
end

sign({ name = "DiagnosticSignError", text = "" })
sign({ name = "DiagnosticSignWarn", text = "" })
sign({ name = "DiagnosticSignHint", text = "" })
sign({ name = "DiagnosticSignInfo", text = "" })

vim.diagnostic.config({
	virtual_text = false,
	signs = true,
	update_in_insert = true,
	underline = true,
	severity_sort = false,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

vim.cmd([[
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])
if vim.g.shadowvim then

else

-- telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
end
