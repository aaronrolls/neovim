return {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      -- Setup specific language servers (e.g., sumneko_lua, rust_analyzer)
      lspconfig.lua_ls.setup({})
      lspconfig.rust_analyzer.setup({})
      -- Ensure LSP capabilities are extended for nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
          capabilities = capabilities,
      })
    end,
  }
