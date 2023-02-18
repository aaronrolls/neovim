return {
	"christoomey/vim-tmux-navigator",
	config = function()
		vim.cmd([[
			let g:tmux_navigator_no_mappings = 1

			noremap <silent> {Left-Mapping} :<C-U>TmuxNavigateLeft<cr>	
			noremap <silent> {Down-Mapping} :<C-U>TmuxNavigateDown<cr>
			noremap <silent> {Up-Mapping} :<C-U>TmuxNavigateUp<cr>
			noremap <silent> {Right-Mapping} :<C-U>TmuxNavigateRight<cr>
			noremap <silent> {Previous-Mapping} :<C-U>TmuxNavigatePrevious<cr>
		]])
	end,
}
