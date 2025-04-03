return {

  {
    'saghen/blink.cmp',
    dependencies = { 'rafamadriz/friendly-snippets' },
    version = '1.*',
    opts = {
      keymap = { preset = 'enter' },
      appearance = { nerd_font_variant = 'mono' },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        ghost_text = {
          enabled = true,
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    init = function ()
      local capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
          }
        }
      }

      capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

      vim.lsp.config("*", {
        capabilities = capabilities,
        root_markers = { ".git" },
      })

      -- stolen from https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
      -- Enable each language server by filename under the lsp/ folder
      vim.lsp.enable({ "luals", "clangd", "bashls" })
    end,
  },
}
