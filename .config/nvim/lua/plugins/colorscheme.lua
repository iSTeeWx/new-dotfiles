return {
  {
    "zootedb0t/citruszest.nvim",
    name = "citruszest",
    init = function()
      vim.cmd("colorscheme citruszest")
      vim.cmd("hi Comment gui=italic")
    end,
  },
}
