return {
  "neovim/nvim-lspconfig",
  init = function ()
    vim.lsp.enable("lua_ls")
    vim.lsp.enable("clangd")
    vim.lsp.enable("jdtls")
  end
}
