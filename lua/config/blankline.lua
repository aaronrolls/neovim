local M = {}

vim.opt.list = true
vim.opt.listchars:append "eol:↴"

function M.setup()
	show_end_of_line = true
end

return M
