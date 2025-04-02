return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      color_overrides = {
        mocha = {
          base = "#121212",
          mantle = "#121212",
          crust = "#121212",
        },
      },
      integrations = {
        blink_cmp = true,
        which_key = true,
        mini = {
          enabled = true,
          indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
        },
      },
    },
    init = function()
      vim.cmd.colorscheme "catppuccin-mocha"
      vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bold=true, italic=true, bg='#89B4FA', fg='#121212' })
      vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bold=true, italic=true, bg='#89B4FA', fg='#121212' })
      vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { bold=true, italic=true, bg='#121212' })
      vim.api.nvim_set_hl(0, 'MiniTablineModifiedVisible', { bold=true, italic=true, bg='#121212' })
    end,
  },
}
