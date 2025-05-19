return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    transparent_background = true,
    color_overrides = {
      mocha = {
        base = "#000000",
        mantle = "#000000",
        crust = "#000000",
      },
    },
    integrations = {
      blink_cmp = true,
      which_key = true,
      fzf = true,
      mini = {
        enabled = true,
        indentscope_color = "", -- catppuccin color (eg. `lavender`) Default: text
      },
    },
  },
  init = function()
    vim.cmd.colorscheme "catppuccin-mocha"
    vim.api.nvim_set_hl(0, 'WinSeparator', { fg = '#A0A0A0' })
  end,
}
