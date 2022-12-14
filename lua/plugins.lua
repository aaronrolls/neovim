local M = {}
	
function M.setup()
	-- Indicate first time installation
	local packer_bootstrap = false
	
	-- packer.nvim configuration
	local conf = {
		profile = {
			enable = true,
			threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
		},

		display = {
			open_fn = function()
				return require("packer.util").float { border = "rounded" }
	    end,
		},
	}
	
	-- Check if packer.nvim is installed
	-- Run PackerCompile if there are changes in this file
	local function packer_init()
		local fn = vim.fn
		local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
		if fn.empty(fn.glob(install_path)) > 0 then
			packer_bootstrap = fn.system {
				"git",
	      "clone",
	      "--depth",
	      "1",
	      "https://github.com/wbthomason/packer.nvim",
	      install_path,
	    }
	    vim.cmd [[packadd packer.nvim]]
		end
		vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
	end
	
	-- Plugins
	local function plugins(use)
		use { "wbthomason/packer.nvim" }
	
	  -- Colorscheme
	  --use {
			--"sainnhe/everforest",
	    --config = function()
				--vim.cmd "colorscheme everforest"
	    --end,
	  --}
	
	  -- Startup screen
	  use {
			"goolord/alpha-nvim",
	    config = function()
				require("config.alpha").setup()
	    end,
	  }
	
	  -- Git
	  use {
			"TimUntersberger/neogit",
			cmd = "Neogit",
	    requires = "nvim-lua/plenary.nvim",
	    config = function()
				require("config.neogit").setup()
	    end,
	  }
		-- Which Key
		use {
			"folke/which-key.nvim",
			event = "VimEnter",
			config= function()
				require("config.whichkey").setup()
			end,
		}

		-- IndentLine
		use {
			"lukas-reineke/indent-blankline.nvim",
			event = "BufReadPre",
			config = function()
				require("config.blankline").setup()
			end,
		}
		-- LSP

		use {
			"neovim/nvim-lspconfig",
			opt = true,
			event = "BufReadPre",
			wants = { "nvim-lsp-installer", "nvim-lsp-installer", "coq_nvim" },
			config = function()
				require("config.lsp").setup()
			end,
			requires = {
				"williamboman/nvim-lsp-installer",
				"ray-x/lsp_signature.nvim",
			},
		}
		
		-- Completion
		use {
			"ms-jpq/coq_nvim",
			branch = "coq",
			event = "InsertEnter",
			opt = true,
			run = ":COQdeps",
			config = function()
				require("config.coq").setup()
			end,
			requires = {
				{ "ms-jpq/coq.artifacts", branch = "artifacts" },
				{ "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
			},
			disable = false,
		}
	  if packer_bootstrap then
			print "Restart Neovim required after installation!"
	    require("packer").sync()
	  end
	end
	
	packer_init()
	
	local packer = require "packer"
	packer.init(conf)
	packer.startup(plugins)
end
	
return M
