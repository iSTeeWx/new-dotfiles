return {
  {
    "zootedb0t/citruszest.nvim",
    name = "citruszest",
    init = function()
      vim.cmd("colorscheme citruszest")
    end,
    opts = {
      style = {
        Comment = { italic = true },
        MiniTablineVisible = { fg = '#BFBFBF', bg = '#232323' },
        MiniTablineHidden = { fg = '#BFBFBF', bg = '#232323' },
        MiniTablineCurrent = { fg = '#28C9FF', bg = '#121212' },
        MiniTablineModifiedVisible = { fg = '#FF5454', bg = '#232323' },
        MiniTablineModifiedHidden = { fg = '#FF5454', bg = '#232323' },
        MiniTablineModifiedCurrent = { fg = '#FF1A75', bg = '#121212' },
        ColorColumn = { bg = '#202020' },
      },
    }
  },
}
