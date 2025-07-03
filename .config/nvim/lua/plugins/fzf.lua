return {
  "ibhagwan/fzf-lua",
  opts = {
    files = {
      no_ignore = true,
      fd_opts = [[--color=never --hidden --type f --type l --exclude .git -I]],
    },
  },
  keys = {
    { "<leader><leader>", "<esc><cmd>FzfLua oldfiles<cr>",                                                                         desc = "Pick in recent files" },
    { "<leader>o",        "<esc><cmd>FzfLua files<cr>",                                                                            desc = "Pick all files" },
    { "grr",              "<esc><cmd>FzfLua lsp_references<cr>",                                                                   desc = "References" },
    { "gra",              "<esc><cmd>FzfLua lsp_code_actions winopts.row=1 previewer=none winopts.width=1 winopts.height=0.2<cr>", desc = "Code Actions" },
    { "grd",              "<esc><cmd>FzfLua diagnostics_document<cr>",                                                             desc = "Diagnostics" },

  }
}
