vim.pack.add({
  { src = "https://github.com/Mofiqul/dracula.nvim" },
})

require("dracula").setup({
  colors = {
    bg = "#000000",
  },
  transparent_bg = true,
  italic_comment = true
})

vim.cmd.colorscheme "dracula"
